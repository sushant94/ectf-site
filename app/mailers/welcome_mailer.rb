class WelcomeMailer < ActionMailer::Base
  default from: "ectf@engineer.org.in"

  def welcome id
    @user = User.find(id)
    mail(:to => @user.email, :subject => "Welcome - ECTF'14")
  end

end
