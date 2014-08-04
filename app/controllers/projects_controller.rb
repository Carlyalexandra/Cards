class ProjectsController < ApplicationController
before_action :authenticate_user!, execpt: :show

  def index
    @projects = current_user.projects
  end

  def new

  end

  def edit
    @project = Project.find(params[:id])
  end

def update
  @project = Project.find(params[:id])
  if @project.update(project_params)
    respond_to do |format|
      format.html {redirect_to project_path(@project), notice: "Project updated"}
      format.json { respond_with_bip(@project) }
    end
  else
     respond_to do |format|
      format.html {render :edit}
      format.json { respond_with_bip(@project) }
    end
  end 
end


  def show
  	@project = Project.find(params[:id])
  	@cards = @project.cards

  end

  def destroy
  end

  private
  def project_params
    params.require(:project).permit(:title)
   end

end
