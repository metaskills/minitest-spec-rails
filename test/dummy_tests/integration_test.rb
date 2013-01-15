require 'test_helper_dummy'

module IntegrationTests
  extend ActiveSupport::Concern
  included do

    fixtures :all

    it 'works' do
      get root_path
      status.must_equal 200
    end

    it 'can find the app' do
      app.must_be_instance_of Dummy::Application
    end

    describe 'nested 1' do

      it('works') { skip }

      it 'can find the app' do
        app.must_be_instance_of Dummy::Application
      end

      describe 'nested 2' do

        it('works') { skip }

      end

    end
    
  end
end

class Dummy::IntegrationTest < ActionDispatch::IntegrationTest
  include IntegrationTests
end
