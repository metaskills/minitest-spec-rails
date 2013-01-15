# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "minitest-spec-rails/version"

Gem::Specification.new do |gem|
  gem.name        = 'minitest-spec-rails'
  gem.version     = MiniTestSpecRails::VERSION
  gem.platform    = Gem::Platform::RUBY
  gem.authors     = ['Ken Collins']
  gem.email       = ['ken@metaskills.net']
  gem.homepage    = 'http://github.com/metaskills/minitest-spec-rails'
  gem.summary     = 'Drop in MiniTest::Spec support for Rails 3 or 4.'
  gem.description = 'Force ActiveSupport::TestCase to subclass MiniTest::Spec for a drop in behavior change.'
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ['lib']
  gem.add_runtime_dependency     'minitest', '~> 4.3'
  gem.add_runtime_dependency     'rails',    '>= 3.0'
  gem.add_development_dependency 'minitest-emoji'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'sqlite3'
end
