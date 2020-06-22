class SessionsController < ApplicationController

    def new
        @session=current_user.sessions.build
        
    end

    def create
        @session=current_user.sessions.build(session_params)   
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
