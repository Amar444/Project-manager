class WorkhoursController < ApplicationController
  before_action :set_workhour, only: [:show, :edit, :update, :destroy]

  def index
    if (params[:workhour_day].present?)
      @workhours = current_user.workhours.select{ |workhour| workhour.date_of_workhour.strftime('%d-%m-%Y') == params[:workhour_day] }
    else
      @workhours = current_user.workhours.select{ |workhour| workhour.date_of_workhour == Date.today }
    end
      
    @workhour = Workhour.new
  end

  def show
  end

  def new
    @workhour = Workhour.new
  end

  def create
    @workhour = Workhour.new(workhour_params)
    @workhour.user = current_user

    respond_to do |format|
      if @workhour.save
        format.html { redirect_to (:back), notice: 'Workhour was successfully created.' }
        format.json { render action: 'show', status: :created, location: @workhour }
      else
        format.html { render action: 'new' }
        format.json { render json: @workhour.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @workhour.update(workhour_params)
        format.html { redirect_to (:back), notice: 'Workhour was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @workhour.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @workhour.destroy
    respond_to do |format|
      format.html { redirect_to (:back), notice: "Workhour has been deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workhour
      @workhour = Workhour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workhour_params
      params.require(:workhour).permit(:hours, :note, :date_of_workhour, :project_id)
    end
end
