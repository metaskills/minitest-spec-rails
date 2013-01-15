ENV['RAILS_ENV'] = 'test'
require 'rubygems'
ENV['BUNDLE_GEMFILE'] = File.expand_path('../../../Gemfile', __FILE__)
require 'bundler/setup'
require 'rails/all'
Bundler.require :default, :development, :test

module Dummy
  class Application < ::Rails::Application

    isolate_namespace Dummy

    config.root = File.join __FILE__, '..'
    config.cache_store = :memory_store
    config.assets.enabled = false
    config.secret_token = '012345678901234567890123456789'

    config.cache_classes = true
    config.whiny_nils = true
    config.consider_all_requests_local = true
    config.action_controller.perform_caching = false
    config.action_dispatch.show_exceptions = false
    config.action_controller.allow_forgery_protection = false
    config.action_mailer.delivery_method = :test
    config.active_support.deprecation = :stderr
    
  end
end

Dummy::Application.initialize!
