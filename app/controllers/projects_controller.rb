class ProjectsController < ApplicationController
  def new
    @project = new_project
  end

  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      redirect_to root_path, notice: I18n.t('project.create.success')
    else
      render :new
    end
  end

  def edit
    @project = get_project
  end

  def update
    @project = get_project
    @project.update_attributes(project_params)

    redirect_to root_path, notice: I18n.t('project.update.success')
  end
  
  def destroy
    @project = get_project
    @project.destroy

    redirect_to root_path, notice: "#{@project.name} has been removed"
  end

  private
  
  def get_project
    current_user.projects.find(params[:id])   
  end

  def new_project
    Project.new
  end

  def project_params
    params.require(:project).permit(:name)
  end
end
