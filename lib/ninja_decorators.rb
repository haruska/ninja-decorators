require "rubygems"

module NinjaDecorators
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods

    def delayed_alias_method_chains
      @delayed_alias_method_chains ||= {}
    end
  
    def method_added(meth)
      if delayed_alias_method_chains[meth.to_s]
        chains_arr = delayed_alias_method_chains.delete(meth.to_s)
        chains_arr.each do |chain|
          chain.each_pair do |filter_type, filtered_method_builder|
            ninja_method_chain meth, filter_type, &filtered_method_builder
          end
        end
      end
    end

    def around_filter(around_method, method_names)
      filter_factory(around_method, method_names, :around)
    end

    def before_filter(before_method, method_names)
      filter_factory(before_method, method_names, :before)
    end

    def after_filter(after_method, method_names)
      filter_factory(after_method, method_names, :after)
    end

    def filter_factory(filter_method, method_names, filter_type)
      method_names.each do |meth|

        # Build up a proc that will construct the filtered method.  Execution of the proc is delayed
        # until we encounter the alias_method_chain call.
        filtered_method_builder = Proc.new do
          # Get a reference to the unfiltered method or, more accurately, the original method with
          # all previous filters already applied.  This new filtered method builds up on the filters
          # already applied.
          unfiltered_method = instance_method "#{meth}_without_#{filter_type.to_s}_filter_wrapper"

          # Define the newly filtered method.
          case filter_type
            when :before
              define_method("#{meth}_with_before_filter_wrapper") do |*args|
                send(filter_method, *args)
                unfiltered_method.bind(self).call(*args)
              end

            when :around
              define_method("#{meth}_with_around_filter_wrapper") do |*args|
                send(filter_method, *args) do |*ar_args|
                  unfiltered_method.bind(self).call(*ar_args)
                end
              end

            when :after
              define_method("#{meth}_with_after_filter_wrapper") do |*args|
                unfiltered_method.bind(self).call(*args)
                send(filter_method, *args)
              end
          end
        end

        # If the method to filter has been defined already.
        if self.instance_methods.include?(meth.to_s)

          # Filter the method with before_method.
          ninja_method_chain meth, "#{filter_type.to_s}_filter_wrapper", &filtered_method_builder

        # If the method to filter has not been defined already, delay wrapping until it has.
        else
          delayed_alias_method_chains[meth.to_s] ||= []
          delayed_alias_method_chains[meth.to_s] << {"#{filter_type.to_s}_filter_wrapper" => filtered_method_builder}
        end
      end
    end

    # This was largely lifted from ActiveSupport's alias_method_chain.  We needed to be able to yield to a block
    # that could construct the with_* methods while having access to the aliased without_* methods.
    def ninja_method_chain(target, feature)
      # Strip out punctuation on predicates or bang methods since
      # e.g. target?_without_feature is not a valid method name.
      aliased_target, punctuation = target.to_s.sub(/([?!=])$/, ''), $1

      with_method, without_method = "#{aliased_target}_with_#{feature}#{punctuation}", "#{aliased_target}_without_#{feature}#{punctuation}"

      alias_method without_method, target

      yield if block_given?

      alias_method target, with_method

      case
      when public_method_defined?(without_method)
        public target
      when protected_method_defined?(without_method)
        protected target
      when private_method_defined?(without_method)
        private target
      end
    end

  end
  
end