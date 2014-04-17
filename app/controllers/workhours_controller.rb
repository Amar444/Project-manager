class WorkhoursController < ApplicationController
  before_action :set_workhour, only: [:show, :edit, :update, :destroy]

  def index
    dateparam = params[:workhour_day]
    @workhour = Workhour.new
    
    if (dateparam.present?)
      @workhours = current_user.workhours.select{ |workhour| workhour.date_of_workhour == dateparam.to_date }
      @weekhours = current_user.workhours.select{ |workhour| workhour.date_of_workhour.cweek == dateparam.to_date.cweek }
      @dateparam = dateparam.to_date
    else
      @workhours = current_user.workhours.select{ |workhour| workhour.date_of_workhour == Date.today }
      @weekhours = current_user.workhours.select{ |workhour| workhour.date_of_workhour.cweek == Date.today.to_date.cweek }
      @dateparam = Date.today
    end   
  end
  
  def weekly
    weekparam = params[:week]
    yearparam = params[:year]
    
    if (weekparam.present? && yearparam.present?)
      @week = weekparam.to_i
      @year = yearparam.to_i
      @weekhours = current_user.workhours.select{ |workhour| workhour.date_of_workhour.cweek == @week && workhour.date_of_workhour.year == @year }.sort_by {|date| date[:date_of_workhour]}.group_by{ |day| day.date_of_workhour }
    else
      @week = Date.today.cweek
      @year = Date.today.year
      @weekhours = current_user.workhours.select{ |workhour| workhour.date_of_workhour.cweek == @week && workhour.date_of_workhour.year == @year }.sort_by {|date| date[:date_of_workhour]}.group_by{ |day| day.date_of_workhour } 
    end
    
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
