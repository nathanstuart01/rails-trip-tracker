class SignupController < ApplicationController
  def index
  end

  def create
    user = User.create(user_params)
    SignupMailer.new_signup(user).deliver
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
