class SessionsController < ApplicationController

    def new
        @session=Session.new

        
    end

    def create
        @session=Session.new(session_params)   
        @session.author_id=current_user.id
        if(@session.save)
            redirect_to user_path,notice:"Session sucessfully Created"
        else
        render :new
        end
    end


    private

    def session_params
        params.require(:session).permit(:name,:amount)
    end
end
