class SessionsController < ApplicationController
        before_action :require_signin
    def new
        @session=current_user.sessions.build
        @group=Group.pluck(:name)
        
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
        params.require(:session).permit(:name,:amount,:group)
    end
end
