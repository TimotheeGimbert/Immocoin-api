class ApplicationController < ActionController::API
  def error_formatter(resource, status = :unprocessable_entity)
    render json: {
      error: {
        title: "une erreur s'est produite",
        message: resource.errors.full_messages.join('; ')
      }
    }, status: status
  end
end
