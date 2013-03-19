require 'test_helper_dummy'

module UsersControllerTests
  extend ActiveSupport::Concern
  included do

    it 'works' do  
      get :index
      assert_select 'h1', "All #{User.count} Users"
    end

    it 'redirects' do
      put :update, :id => 0
      assert_redirected_to users_url
    end
    
  end
end

class UsersControllerTest < ActionController::TestCase
  include UsersControllerTests
end

describe UsersController do
  include UsersControllerTests
end
