class UserMailer < ActionMailer::Base

  def welcome(user)
    recipients  user.email
    from        'rails@minitest.spec'
    subject     'Welcome'
    body        :user => user
  end

end
