class ProjectsController < ApplicationController
  def new
    @project = new_project
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to root_path, notice: I18n.t('project.create.success')
    else
      render :new
    end
  end

  private

  def new_project
    Project.new
  end

  def project_params
    params.require(:project).permit(:name)
  end
end
