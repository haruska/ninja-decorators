# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ninja-decorators}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jason Haruska"]
  s.date = %q{2008-11-21}
  s.description = %q{Implements before_filter, after_filter, and around_filter decorators similar to Rails but can be used anywhere}
  s.email = ["contact@haruska.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc"]
  s.files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "lib/ninja_decorators.rb", "test/test_helper.rb", "test/test_ninja_decorators.rb", "test/ninja_class.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/haruska/ninja-decorators}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Implements before_filter, after_filter, and around_filter decorators similar to Rails but can be used anywhere}
  s.test_files = ["test/test_helper.rb", "test/test_ninja_decorators.rb", "test/ninja_class.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 2.0.2"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<activesupport>, [">= 2.0.2"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 2.0.2"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
