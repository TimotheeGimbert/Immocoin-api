class Users::MembersController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: {
      id: current_user.id,
      email: current_user.email,
      first_name: current_user.first_name,
      last_name: current_user.last_name
    }
  end

  def update
    if current_user.update(user_params)
      render json: {
        id: current_user.id,
        email: current_user.email,
        first_name: current_user.first_name,
        last_name: current_user.last_name
      }
    else
      render json: current_user.errors, status: :unprocessable_entity
    end

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
