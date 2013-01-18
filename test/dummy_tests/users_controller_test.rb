require 'test_helper_dummy'

module UsersControllerTests
  extend ActiveSupport::Concern
  included do

    before { get :index }

    it 'works' do  
      assert_select 'h1', "All #{User.count} Users"
    end
    
  end
end

class UsersControllerTest < ActionController::TestCase
  include UsersControllerTests
end

describe UsersController do
  include UsersControllerTests
end
