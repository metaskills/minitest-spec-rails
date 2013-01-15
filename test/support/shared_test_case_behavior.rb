module MiniTestSpecRails
  module SharedTestCaseBehavior

    extend ActiveSupport::Concern

    included do
      before           { setup_dummy_schema }
      let(:app)        { Dummy::Application }
      let(:user_ken)   { Dummy::User.create! :email => 'ken@metaskills.net' }
    end

    private

    def setup_dummy_schema
      ActiveRecord::Base.class_eval do
        silence do
          connection.instance_eval do
            create_table :dummy_users, :force => true do |t|
              t.string :email
            end
          end
        end
      end
    end
    
  end
end

