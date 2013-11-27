require 'test_helper_dummy'

module UserMailerTests
  extend ActiveSupport::Concern
  included do

    let(:deliveries)        { ActionMailer::Base.deliveries }
    let(:user_mailer_class) { UserMailer }
    let(:user_email)        { user_mailer_class.welcome(user_ken).deliver }

    it 'works' do
      deliveries.must_be :empty?
      user_email
      deliveries.wont_be :empty?
      user_email.to.must_equal    [user_ken.email]
      user_email.from.must_equal  ['rails@minitest.spec']
      user_email.body.encoded.must_equal "Welcome to MiniTest::Spec #{user_ken.email}!"
    end

    it 'allows custom assertions' do
      assert_emails(1) { user_email }
    end

    it 'can find the mailer_class' do
      self.class.mailer_class.must_equal user_mailer_class
    end

    describe 'nested 1' do

      it('works') { skip }

      it 'can find the mailer_class' do
        self.class.mailer_class.must_equal user_mailer_class
      end

      describe 'nested 2' do

        it('works') { skip }

      end

    end
    
  end
end

class UserMailerTest < ActionMailer::TestCase
  include UserMailerTests
  it 'reflects' do
    described_class.must_equal UserMailer
    self.class.described_class.must_equal UserMailer
  end
  describe 'level 1' do
    it 'reflects' do
      described_class.must_equal  UserMailer
      self.class.described_class.must_equal UserMailer
    end
    describe 'level 2' do
      it 'reflects' do
        described_class.must_equal  UserMailer
        self.class.described_class.must_equal UserMailer
      end
    end
  end
end

describe UserMailer do
  include UserMailerTests
  it 'reflects' do
    described_class.must_equal UserMailer
    self.class.described_class.must_equal UserMailer
  end
  describe 'level 1' do
    it 'reflects' do
      described_class.must_equal UserMailer
      self.class.described_class.must_equal UserMailer
    end
    describe 'level 2' do
      it 'reflects' do
        described_class.must_equal UserMailer
        self.class.described_class.must_equal UserMailer
      end
    end
  end
end
