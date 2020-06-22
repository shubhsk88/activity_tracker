class GroupsController < ApplicationController

    def index
        @group=Group.ApplicationController

        
    end

    def new
      @group=Group.new

    end

    def create
        @group=Group.new(group_params)
        if(@group.save)
            redirect_to users_path(current_user),notice:"Group sucessfully created"

        else
            render :new
        end 
        
        private
        def group_params
            params.require(:group).permit(:name,:icon)
        end
    end


    
end
