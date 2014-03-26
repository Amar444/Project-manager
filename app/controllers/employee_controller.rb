class EmployeeController < ApplicationController
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
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user, :notice => 'User is succesfully created'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      @user = User.find(params[:id])

      if @user.update(user_params)
        format.html { redirect_to (:back), notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit', notice: 'Something went wrong' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end

    end
  end

  def user_params
    params.require(:user).permit(:email)
  end

end