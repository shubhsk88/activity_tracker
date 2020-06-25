class SessionsController < ApplicationController
  before_action :require_signin

  def index
    case params[:filter]
    when 'mysession'
      @total = current_user.my_sessions_count
      @session = current_user.my_sessions
      @title = 'My Activity Log'
    when 'external'
      @total = current_user.my_external_sessions_count
      @session = current_user.my_external_sessions
      @title = 'My External Activity Log'

    when 'top'
      @total = current_user.top_activities_count
      @session = current_user.top_activities
      @title = 'My Popular activities'
    else
      redirect_to user_url(current_user)
    end
  end

  def new
    groups_list
    @session = current_user.sessions.build
  end

  def create
    @session = current_user.sessions.build(session_params)
    @session.group = params[:group]

    if @session.save
      redirect_to sessions_path, notice: 'Session sucessfully Created'
    else
      groups_clean
      render :new
    end
  end

  private

  def groups_list
    @group_options = Group.all.map { |g| [g.name, g.name] }
    @group_options.unshift(['Select a group (optional)', nil])
  end

  def groups_clean
    @group_options = Group.all.map { |g| [g.name, g.name] }
  end

  def session_params
    params.require(:session).permit(:name, :amount, :group)
  end
end
