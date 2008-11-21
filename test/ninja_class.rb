require File.dirname(__FILE__) + '/../lib/ninja_decorators'

class NinjaClass
  include NinjaDecorators
  
  attr_accessor :ret
  
  around_filter :common_around, [:foo, :bar]
  
  def foo
    @ret += "foo"
  end
  
  def bar
    @ret += "bar"
  end
  
  private
  
  def common_around
    @ret = "common "
    yield
    @ret += " around"
  end
end