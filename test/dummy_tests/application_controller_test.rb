require 'test_helper_dummy'

module ApplicationControllerTests
  extend ActiveSupport::Concern
  included do

    it 'works' do
      get :index
      response.body.must_equal 'Rendered MiniTest::Spec'
    end

    it 'allows custom assertions' do
      assert_blank ''
    end

    # describe 'nested 1' do

    #   it('works') { skip }

    #   describe 'nested 2' do

    #     it('works') { skip }

    #   end

    # end
    
  end
end

class Dummy::ApplicationControllerTest < ActionController::TestCase
  include ApplicationControllerTests
end

describe Dummy::ApplicationController do
  include ApplicationControllerTests
end
