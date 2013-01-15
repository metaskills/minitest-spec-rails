require 'test_helper'

class MiniTestSpecRailsTest < MiniTestSpecRails::TestCase

  it 'defines MINITEST_SPEC_RAILS in the Test::Unit::TestCase shim' do
    assert Test::Unit::TestCase.const_defined? :MINITEST_SPEC_RAILS
    assert Test::Unit::TestCase::MINITEST_SPEC_RAILS
  end


end
