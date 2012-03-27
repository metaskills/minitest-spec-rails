class << ActiveSupport::TestCase
  remove_method :describe
end if defined?(ActiveSupport::TestCase)
