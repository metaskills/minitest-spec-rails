
if ENV['CI'].blank? && RUBY_VERSION >= '1.9'
  require 'minitest/emoji'
  MiniTest::Emoji::DEFAULT.merge! '.' => "\u{1f49A} ", 'F' => "\u{1f494} ", 'E' => "\u{1f480} ", 'S' => "\u{1f49B} "
end

