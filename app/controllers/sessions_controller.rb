class SessionsController < ApplicationController
        before_action :require_signin
    
    def index
        case params[:filter]
        when "my_session"
            @total=current_user.my_sessions_count
            @session=current_user.my_sessions
            @title="My Session Schedule"    
        when "external"
            @total=current_user.my_external_sessions_count
            @session=current_user.my_external_sessions
            @title="My External Schedule"
            
        when "recent"    
            @total=current_user.recent_count
            @session=current_user.recent
            @title="My Recent Created Habits"
        else
            redirect_to user_url(current_user)
        end
    end
    
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
