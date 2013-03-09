module MiniTestSpecRails
end

require 'rails'
require 'minitest/spec'
require 'minitest-spec-rails/version'
require 'minitest-spec-rails/dsl'
require 'minitest-spec-rails/rails' if Rails.env.test?
