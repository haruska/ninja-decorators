require 'rubygems'
require File.dirname(__FILE__) + '/test_helper.rb'
require 'around_ninja_subject'

class TestNinjaDecorators < Test::Unit::TestCase

  def setup
  end
  
  def test_simple_around_filter
    ninja = AroundNinjaSubject.new
    assert_equal "common foo around", ninja.foo
    ninja.ret = ""
    assert_equal "common bar around", ninja.bar
  end
  
  def test_nested_around_filter
    ninja = AroundNinjaSubject.new
    assert_equal "nesting common nested around completed", ninja.nested
  end
end
