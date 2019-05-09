class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find_by(slug: params[:slug])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project
    else
      flash[:warn] = 'Project did not save'
      render 'new'
    end
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :date_started, :user_ids)
  end
end
