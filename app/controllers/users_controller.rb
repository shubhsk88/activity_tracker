class UsersController < ApplicationController
    before_action :require_signin ,except: %i[create new show]
    def new
    @user=User.new
    
    end

    def create
        
        @user=User.new(user_params)
        if @user.save
            session[:username] = @user.username
            redirect_to user_path(@user),notice:"Thanks for signing up"
        else 
            render :new 
        end

    end


    def show
        
        @user=User.find_by(username:params[:id])
        @sessions=@user.sessions

    
    
    end


    private

    def user_params
        params.require(:user).permit(:username,:name)
    end
end
