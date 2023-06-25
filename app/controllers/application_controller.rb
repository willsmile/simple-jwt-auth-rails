# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::Helpers

  helper_method :current_user
  before_action :authenticate!

  rescue_from StandardError, with: :handle_exception
  rescue_from SimpleJwtAuthErrors::InvalidParameterError, with: :handle_simple_jwt_auth_error
  rescue_from SimpleJwtAuthErrors::UnauthorizedError, with: :handle_simple_jwt_auth_error
  rescue_from SimpleJwtAuthErrors::NotPermittedError, with: :handle_simple_jwt_auth_error

  def handle_simple_jwt_auth_error(error)
    res = {
      errorType: error.error_type,
      description: error.message
    }

    render json: res, status: error.status_code
  end

  def handle_exception(error)
    res = {
      errorType: "unexpected_error",
      description: "This is a unexpected error"
    }

    render json: res, status: 500
  end

  private

  def current_user
    false
  end

  def authenticate!
    raise SimpleJwtAuthErrors::UnauthorizedError.new("Your authorization failed.", "unauthorized") \
      unless current_user
  end
end
