class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: {
      id: current_user.id,
      email: current_user.email,
      first_name: current_user.first_name || nil,
      last_name: current_user.last_name || nil
    }
  end

  def register_failed
    render json: { message: "Something went wrong." }
  end
end
