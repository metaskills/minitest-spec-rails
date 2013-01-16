require 'test_helper_dummy'

module UserTests
  extend ActiveSupport::Concern
  included do

    it 'works' do
      user_ken.must_be_instance_of User
    end

    it 'allows custom assertions' do
      assert_blank ''
    end

    describe 'nested 1' do

      it('works') { skip }

      describe 'nested 2' do

        it('works') { skip }

      end

    end
    
  end
end

class UserTest < ActiveSupport::TestCase
  include UserTests
end

describe User do
  include UserTests
end
