class RegistrationsController < Devise::RegistrationsController
  def new
    redirect_to root_path, alert: "Please contact your local account manager to make an account for you!"
  end
end