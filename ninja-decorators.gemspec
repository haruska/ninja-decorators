# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ninja-decorators}
  s.version = "0.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jason Haruska", "Kevin Menard"]
  s.date = %q{2009-05-27}
  s.email = %q{contact@haruska.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "History.txt",
     "Manifest.txt",
     "PostInstall.txt",
     "README.rdoc",
     "Rakefile",
     "VERSION.yml",
     "lib/ninja_decorators.rb",
     "ninja-decorators.gemspec",
     "test/after_ninja_subject.rb",
     "test/around_ninja_subject.rb",
     "test/before_ninja_subject.rb",
     "test/ninja_decorators_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/haruska/ninja-decorators/}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{before_filter, after_filter, and around_filter for ruby without rails}
  s.test_files = [
    "test/after_ninja_subject.rb",
     "test/around_ninja_subject.rb",
     "test/before_ninja_subject.rb",
     "test/ninja_decorators_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
