require 'rubygems'
require File.dirname(__FILE__) + '/test_helper.rb'
require 'ninja_class'

class TestNinjaDecorators < Test::Unit::TestCase

  def setup
  end
  
  def test_simple_around_filter
    ninja = NinjaClass.new
    assert_equal "common foo around", ninja.foo
    ninja.ret = ""
    assert_equal "common bar around", ninja.bar
  end
  
  def test_nested_around_filter
    ninja = NinjaClass.new
    assert_equal "nesting common nested around completed", ninja.nested
  end
end
