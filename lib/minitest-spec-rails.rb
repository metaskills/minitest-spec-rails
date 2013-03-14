module MiniTestSpecRails
end

require 'rubygems'
require 'active_support/all'
require 'active_support/test_case'
require 'minitest/spec'
require 'minitest-spec-rails/version'
require 'minitest-spec-rails/dsl'
require 'minitest-spec-rails/rails' if Rails.env.test?
