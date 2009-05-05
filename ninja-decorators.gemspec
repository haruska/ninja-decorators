# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ninja-decorators}
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jason Haruska", "Kevin Menard"]
  s.date = %q{2009-05-04}
  s.email = %q{contact@haruska.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "History.txt",
    "Manifest.txt",
    "PostInstall.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION.yml",
    "lib/ninja_decorators.rb",
    "test/around_ninja_subject.rb",
    "test/test_helper.rb",
    "test/ninja_decorators_test.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/haruska/ninja-decorators/}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{before_filter, after_filter, and around_filter for ruby without rails}
  s.test_files = [
    "test/around_ninja_subject.rb",
    "test/test_helper.rb",
    "test/ninja_decorators_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 2.0.2"])
    else
      s.add_dependency(%q<activesupport>, [">= 2.0.2"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 2.0.2"])
  end
end
