module MiniTestSpecRails
  module SharedTestCaseBehavior

    extend ActiveSupport::Concern

    included do
      before           { setup_dummy_schema }
      let(:app)        { Dummy::Application }
      let(:user_ken)   { User.create! :email => 'ken@metaskills.net' }
    end

    private

    def setup_dummy_schema
      ActiveRecord::Base.class_eval do
        silence do
          connection.instance_eval do
            create_table :users, :force => true do |t|
              t.string :email
            end
          end
        end
      end
    end

    def rails_version
      Rails.version.split('.')[0,2].join('.')
    end

    def rails30? ; rails_version == '3.0' ; end
    def rails31? ; rails_version == '3.1' ; end
    def rails32? ; rails_version == '3.2' ; end
    def rails40? ; rails_version == '4.0' ; end
    
  end
end

