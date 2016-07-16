class TeamsController < ApplicationController

  def show
    @project = Project.find params[:project_id]
    @team = @project.teams.find params[:id]
  end

end
