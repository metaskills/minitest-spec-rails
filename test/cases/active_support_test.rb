require 'test_helper'

class ActiveSupportTest < MiniTestSpecRails::TestCase

  it 'removes ActiveSupport describe method' do
    ActiveSupport::TestCase.singleton_methods(false).map(&:to_sym).wont_include :describe
  end


end
