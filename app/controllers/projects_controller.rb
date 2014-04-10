class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :destroy]
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all  
    projects = current_user.workhours.map { |w| w.project }
    @userprojects = projects.uniq
   
   @projects_with_hours = @userprojects.map do |project|
     hours = project.workhours_by_user(current_user.id).map(&:hours).sum
     OpenStruct.new(project: project, hours: hours)
   end

  end

  def new
    @project = Project.new
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to (:back), notice: 'Project was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to (:back), notice: "#{@project.name} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if current_user.role == "admin" || current_user.role == "administrator"
      @project.destroy
      respond_to do |format|
        format.html { redirect_to (:back), notice: "#{@project.name} has been deleted." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to (:back), alert: 'You don\'t have sufficient permissions to do this' }
        format.json { head :no_content }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:name, :description)
  end
end
