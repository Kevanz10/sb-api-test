class ApplicationController < ActionController::API
	include CanCan::ControllerAdditions

	#for displaying error message on unauthorized
	rescue_from CanCan::AccessDenied do |exception|
    render json: exception.message, status: :unauthorized
  end
end
