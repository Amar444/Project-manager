class WorkhoursController < ApplicationController
  before_action :set_workhour, only: [:show, :edit, :update, :destroy]

  # GET /workhours
  # GET /workhours.json
  def index
    @workhours = Workhour.all
  end

  # GET /workhours/1
  # GET /workhours/1.json
  def show
  end

  # GET /workhours/new
  def new
    @workhour = Workhour.new
  end

  # GET /workhours/1/edit
  def edit
  end

  # POST /workhours
  # POST /workhours.json
  def create
    @workhour = Workhour.new(workhour_params)

    respond_to do |format|
      if @workhour.save
        format.html { redirect_to @workhour, notice: 'Workhour was successfully created.' }
        format.json { render action: 'show', status: :created, location: @workhour }
      else
        format.html { render action: 'new' }
        format.json { render json: @workhour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workhours/1
  # PATCH/PUT /workhours/1.json
  def update
    respond_to do |format|
      if @workhour.update(workhour_params)
        format.html { redirect_to @workhour, notice: 'Workhour was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @workhour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workhours/1
  # DELETE /workhours/1.json
  def destroy
    @workhour.destroy
    respond_to do |format|
      format.html { redirect_to workhours_url }
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
      params.require(:workhour).permit(:hours, :note, :date_of_workhour, :user_id, :project_id)
    end
end
