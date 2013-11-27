require 'test_helper_dummy'

module ApplicationControllerTests
  extend ActiveSupport::Concern
  included do

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
  it 'reflects' do
    described_class.must_equal ApplicationController
    self.class.described_class.must_equal ApplicationController
  end
  describe 'level 1' do
    it 'reflects' do
      described_class.must_equal  ApplicationController
      self.class.described_class.must_equal ApplicationController
    end
    describe 'level 2' do
      it 'reflects' do
        described_class.must_equal  ApplicationController
        self.class.described_class.must_equal ApplicationController
      end
    end
  end
end

describe ApplicationController do
  include ApplicationControllerTests
  it 'class reflects' do
    described_class.must_equal ApplicationController
    self.class.described_class.must_equal ApplicationController
  end
  it 'reflects' do
    described_class.must_equal ApplicationController
    self.class.described_class.must_equal ApplicationController
  end
  describe 'level 1' do
    it 'reflects' do
      described_class.must_equal ApplicationController
      self.class.described_class.must_equal ApplicationController
    end
    describe 'level 2' do
      it 'reflects' do
        described_class.must_equal ApplicationController
        self.class.described_class.must_equal ApplicationController
      end
    end
  end
end
