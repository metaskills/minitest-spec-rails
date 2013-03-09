guard 'minitest' do
  watch(%r|^lib/minitest-spec-rails/init/(.*)\.rb|)  { |m| "test/cases/#{m[1]}_test.rb" }
  watch(%r|^test/test_helper\.rb|)                   { "test" }
  watch(%r|^test/test_helper_dummy\.rb|)             { "test" }
  watch(%r|^test/cases/(.*)_test\.rb|)
  watch(%r|^test/dummy_tests/(.*)_test\.rb|)
end
