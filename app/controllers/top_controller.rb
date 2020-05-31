class TopController < ApplicationController
  def index
    @tasklists = Tasklist.where(user: current_user).order("created_at ASC")
  end

end
