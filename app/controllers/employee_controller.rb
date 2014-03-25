class EmployeeController < ApplicationController
  def index
    @user = User.all
  end
  
end