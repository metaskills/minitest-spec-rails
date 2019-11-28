ENV['RAILS_ENV'] ||= 'test'
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __dir__)
require 'bundler/setup'
require 'rails/all'
Bundler.require(:default, Rails.env)

module Dummy
  class Application < ::Rails::Application
    # Basic Engine
    config.root = File.join __FILE__, '..'
    config.cache_store = :memory_store
    config.assets.enabled = false
    if Rails.version > '5.0'
      config.secret_key_base = '012345678901234567890123456789'
    else
      config.secret_token = '012345678901234567890123456789'
    end
    config.active_support.test_order = :random
    if config.active_record.sqlite3.respond_to?(:represent_boolean_as_integer)
      config.active_record.sqlite3.represent_boolean_as_integer = true
    end

    # Mimic Test Environment Config.
    config.whiny_nils = true if Rails.version < '4.0'
    config.consider_all_requests_local = true
    config.action_controller.perform_caching = false
    config.action_dispatch.show_exceptions = false
    config.action_controller.allow_forgery_protection = false
    config.action_mailer.delivery_method = :test
    config.active_support.deprecation = :stderr
    config.allow_concurrency = true
    config.cache_classes = true
    config.dependency_loading = true
    config.preload_frameworks = true
    config.eager_load = true

    # Custom
    config.minitest_spec_rails.mini_shoulda = true
  end
end

Dummy::Application.initialize!
require 'rails/test_help'

# Avoids local NoMethodError: undefined method `split' for nil:NilClass
Rails.backtrace_cleaner.remove_silencers!
