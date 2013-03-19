require 'test_helper_dummy'
require File.expand_path('../../dummy_app/lib/library', __FILE__)

class LibraryTest < ActiveSupport::TestCase
  it 'reflects' do
    describing_class.must_equal LibraryTest
    described_class.must_equal Library
  end
end

describe Library do
  it 'reflects' do
    described_class.must_equal Library
    self.class.described_class.must_equal Library
  end
end
