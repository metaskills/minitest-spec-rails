require 'test_helper_dummy'

module IntegrationTests
  def self.included(klass)
    klass.class_eval do

      it 'works' do
        get root_path
        status.must_equal 200
      end

      describe 'nested 1' do

        it('works') { skip }

        describe 'nested 2' do

          it('works') { skip }

        end

      end

    end    
  end
end

class IntegrationTest < ActionController::IntegrationTest
  include IntegrationTests
end
