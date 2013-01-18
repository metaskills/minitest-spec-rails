require 'test_helper_dummy'

module ApplicationControllerTests
  extend ActiveSupport::Concern
  included do

    tests ApplicationController if MiniTestSpecRails::Util.rails30?

    before { get :index }

    it 'works' do
      get :index
      response.body.must_equal 'Rendered MiniTest::Spec'
    end

    it 'allows custom assertions' do
      assert_template :partial => false
    end

    it 'can find the controller_class' do
      self.class.controller_class.must_equal ApplicationController
    end

    it 'can access the setup ivars' do
      @controller.must_be_kind_of ApplicationController
    end

    describe 'nested 1' do

      it('works') { skip }

      it 'can find the controller_class' do
        self.class.controller_class.must_equal ApplicationController
      end

      describe 'nested 2' do

        it('works') { skip }

      end

    end
    
  end
end

class ApplicationControllerTest < ActionController::TestCase
  include ApplicationControllerTests
end

describe ApplicationController do
  include ApplicationControllerTests
end
