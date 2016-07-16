class ProjectMembershipsController < ApplicationController

  def create
    @project = Project.find params[:project_id]
    @project.project_memberships.create user: current_user
    redirect_to @project, notice: 'You are now a member of the project'
  end


end
