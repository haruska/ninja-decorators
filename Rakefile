require 'rake'
require 'rake/gempackagetask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "ninja-decorators"
    gemspec.summary = "before_filter, after_filter, and around_filter for ruby without rails"
    gemspec.email = "contact@haruska.com"
    gemspec.homepage = "http://github.com/haruska/ninja-decorators/"
    gemspec.authors = ["Jason Haruska", "Kevin Menard"]
    
    gemspec.add_dependency('activesupport', '>= 2.0.2')
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end