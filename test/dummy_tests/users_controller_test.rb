require 'test_helper_dummy'

module UsersControllerTests
  extend ActiveSupport::Concern
  included do

    it 'works' do
      get :index
      assert_select 'h1', "All #{Dummy::User.count} Users"
    end
    
  end
end

class Dummy::UsersControllerTest < ActionController::TestCase
  include UsersControllerTests
end

describe Dummy::UsersController do
  include UsersControllerTests
end
