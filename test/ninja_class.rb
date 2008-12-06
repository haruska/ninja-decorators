require File.dirname(__FILE__) + '/../lib/ninja_decorators'

class NinjaClass
  include NinjaDecorators

  around_filter :common_around, [:foo, :bar, :nested]
  around_filter :nested_around, [:nested]

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
  
  def common_around
    @ret += "common "
    yield
    @ret += " around"
  end
  
  def nested_around
    @ret += "nesting "
    yield
    @ret += " completed"
  end
end