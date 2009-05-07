require File.dirname(__FILE__) + '/../lib/ninja_decorators'

class AfterNinjaSubject
  include NinjaDecorators

  after_filter :common_before, [:foo, :bar, :nested]
  after_filter :nested_before, [:nested]

  attr_accessor :ret

  def initialize
    @ret = ""
  end

  def foo
    @ret += "foo"
  end

  def bar
    @ret += "bar"
  end

  def nested
    @ret += "nested"
  end

  private

  def common_before
    @ret += "common "
    yield if block_given?
    @ret += " around"
  end

  def nested_before
    @ret += "nesting "
    yield if block_given?
    @ret += " completed"
  end
end