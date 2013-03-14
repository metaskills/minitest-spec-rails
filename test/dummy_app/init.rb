ENV['RAILS_ENV'] = 'test'
require 'rubygems'
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../../Gemfile', __FILE__)
require 'bundler/setup'
require 'active_support/all'
require 'action_controller'
require 'action_view'
require 'action_mailer'
require 'test_help'
require 'rails/version'
require 'initializer'
Bundler.require :default, :development, :test
require "#{File.expand_path('../config/environment.rb', __FILE__)}"
