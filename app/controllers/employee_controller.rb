class EmployeeController < ApplicationController
  before_filter :check_role
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(new_user_params)
    if @user.save
      redirect_to (:back), :notice => 'User is succesfully created'
    else
      render :new, alert: 'something went wrong!'
    end
  end

  def update
    respond_to do |format|
      @user = User.find(params[:id])

      if @user.update(user_params)
        format.html { redirect_to (:back), notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit', alert: 'Something went wrong' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end

    end
  end

  def user_params
    params.require(:user).permit(:email,:full_name, :role)
  end
  def new_user_params
    params.require(:user).permit(:email,:full_name, :password, :password_confirmation, :role)
  end


  protected

  def check_role
    if current_user.role = "moderator" || current_user.role = "admin"
    else
      redirect_to root_path, alert: 'You don\'t have sufficient permissions to access this page.' 
    end
  end

end