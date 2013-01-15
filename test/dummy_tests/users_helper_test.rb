require 'test_helper_dummy'

module UsersHelperTests
  extend ActiveSupport::Concern
  included do

    let(:users_list) { render_users_list Dummy::User.all }

    before { user_ken }

    it 'works' do
      user_ken
      users_list.must_equal "<ul><li>#{user_ken.email}</li></ul>"
    end

    it 'can find the helper_class' do
      self.class.helper_class.must_equal Dummy::UsersHelper
    end

    describe 'nested 1' do

      it('works') { skip }

      it 'can find the helper_class' do
        self.class.helper_class.must_equal Dummy::UsersHelper
      end

      describe 'nested 2' do

        it('works') { skip }

      end

    end
    
  end
end

class Dummy::UsersHelperTest < ActionView::TestCase
  include UsersHelperTests
end

describe Dummy::UsersHelper do
  include UsersHelperTests
end
