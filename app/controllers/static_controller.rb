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
        user = User.find(params[:id].to_i)
        if user.nil?
            redirect_to(action: 'dashboard')
        end
        if current_user.confirmed && user.team.id == current_user.team.id
            if params[:type] == 'ignore'
                WelcomeMailer.delay.ignored(user.id)
                user.destroy
            else
                user.confirmed = true
                user.save
            end
        end
        redirect_to(action: 'dashboard')
    end


end
