class StaticController < ApplicationController
    before_action :authenticate_user!, only: [:dashboard]

    def root
      render 'home'
  end

  def newbie
  end

  def faq
   render 'faq'
end

def sponsors
end

def rules
end

def dashboard
    @members = current_user.team.users
end

def confirm
    if current_user.confirmed
       user = User.find(params[:id].to_i)
       if params[:type] == 'ignore'
        WelcomeMailer.delay.ignored(user.id)
        user.destroy
        redirect_to(action: 'dashboard')
    end

    if user.team.id == current_user.team.id
        user.confirmed = true
        user.save
    end
end
redirect_to(action: 'dashboard')
end

end
