require "rubygems"
require "activesupport"

module NinjaDecorators
  VERSION = '0.0.2'
  
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
  
    @@delayed_alias_method_chains = {}
  
    def method_added(meth)
      if @@delayed_alias_method_chains[meth.to_s]
        chains_arr = @@delayed_alias_method_chains.delete(meth.to_s)
        chains_arr.each do |chain|
          self.send(:alias_method_chain, meth, chain)
        end
      end
    end

    def around_filter(around_method, function_names)
      function_names.each do |func|
        define_method("#{func}_with_around_filter_wrapper") do |*args|
          send(around_method, *args) do |*ar_args|
            send "#{func}_without_around_filter_wrapper", *ar_args
          end
        end

        if self.instance_methods.include?(func.to_s)
          alias_method_chain func, :around_filter_wrapper
        else
          @@delayed_alias_method_chains[func.to_s] ||= []
          @@delayed_alias_method_chains[func.to_s] << :around_filter_wrapper
        end
      
      end
    end
  
  end
  
end