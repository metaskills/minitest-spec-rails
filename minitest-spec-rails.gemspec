# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "minitest-spec-rails/version"

Gem::Specification.new do |s|
  s.name        = 'minitest-spec-rails'
  s.version     = MiniSpecUnit::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Ken Collins']
  s.email       = ['ken@metaskills.net']
  s.homepage    = 'http://github.com/metaskills/minitest-spec-rails'
  s.summary     = 'Make Test::Unit::TestCase a subclass of of MiniTest::Spec.'
  s.description = 'Force ActiveSupport::TestCase to subclass MiniTest::Spec for a drop in behavior change.'
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
  s.add_runtime_dependency     'minitest', '~> 2.11'
  s.add_development_dependency 'rake'
end
