class WelcomeMailer < ActionMailer::Base
  default from: "ectf@engineer.org.in"

  def welcome id
    @user = User.find(id)
    mail(:to => @user.email, :subject => "Welcome - ECTF'14")
  end

  def notify id
    @user = User.find(id)
    mail(:to => @user.email, :subject => "Important Notification - ECTF'14")
end

def ignored id
    @user = User.find(id)
    mail(:to => @user.email, :subject => "Membership to team #{user.teamName} - ECTF'14")
end

end
