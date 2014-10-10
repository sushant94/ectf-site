class StaticController < ApplicationController

    def root
      render 'home'
    end

    def newbie
    end

    def faq
    	render 'faq'
    end
end
