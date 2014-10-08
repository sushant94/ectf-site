class WelcomeMailer < ActionMailer::Base
  default from: "ectf@engineer.org.in"

  def welcome id
    @user = User.find(id)
  end

end
