# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "minitest-spec-rails/version"

Gem::Specification.new do |s|
  s.name        = 'minitest-spec-rails'
  s.version     = MiniTestSpecRails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Ken Collins']
  s.email       = ['ken@metaskills.net']
  s.homepage    = 'http://github.com/metaskills/minitest-spec-rails'
  s.summary     = 'Drop in MiniTest::Spec support for Rails 3.x'
  s.description = 'Force ActiveSupport::TestCase to subclass MiniTest::Spec for a drop in behavior change.'
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
  s.add_runtime_dependency     'minitest'
  s.add_runtime_dependency     'rails',    '~> 3.0'
  s.add_development_dependency 'rake'
end
