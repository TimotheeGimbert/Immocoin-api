class Users::MembersController < ApplicationController
  before_action :authenticate_user!

  def show
    render_user_json
  end

  def update
    if current_user.update(user_params)
      render_user_json
    else
      error_formatter(current_user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
