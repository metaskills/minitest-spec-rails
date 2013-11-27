require 'test_helper_dummy'
require "#{Dummy::Application.root}/lib/library"

class LibraryTest < ActiveSupport::TestCase
  it 'reflects' do
    described_class.must_equal Library
  end
end

describe Library do
  it 'reflects' do
    described_class.must_equal Library
    self.class.described_class.must_equal Library
  end
end
