class StaticController < ApplicationController
    #before_action :authenticate_user!, except: [:root,:newbie]

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

end
