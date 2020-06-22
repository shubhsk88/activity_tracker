class LoginsController < ApplicationController
    def new
        
    end

    def create
        user=User.find_by(username:params[:username])
        if(user)
            session[:user_id]=user.id
            redirect_to (session[:intended_url] || user), notice: "Welcome back #{user.name}"
        else
            flash.now[:alert] = 'Invalid Username'
            render :new 
        end     
    end

    def destroy
        session[:user_id] = nil
        redirect_to users_path, notice: 'You are now signed out'
        
    end

end
