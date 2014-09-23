class StaticController < ApplicationController
    def submit
        email = params["email"]
        if Email.find_by_email(email).nil?
            Email.create(email: email)
        end
        redirect_to '/index.html'
    end
end
