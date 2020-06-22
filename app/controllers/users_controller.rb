class UsersController < ApplicationController
    def new
    @user=User.new
    
    end

    def create
        
        @user=User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user),notice:"Thanks for signing up"
        else 
            render :new 
        end

    end


    def show
        @user=User.find(params[:id])
        @sessions=@user.sessions

    
    
    end


    private

    def user_params
        params.require(:user).permit(:username,:name)
    end
end
