class LoginsController < ApplicationController
    def new
        
    end

    def create
        
        user=User.find_by(username:params[:username])
        puts user
        if(user.nil?)
            
             flash.now[:alert] = 'Invalid Credentials'
            render :new 
        else
            session[:user_id]=user.id
            redirect_to (session[:intended_url] || user), notice: "Welcome back #{user.name}"
            
        end     
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_url
        
    end
    
end
