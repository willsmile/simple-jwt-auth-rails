# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate!

  def create
    raise SimpleJwtAuthErrors::UnauthorizedError.new("Your username and password do not match.", "failed_to_login") \
      if account_not_exist? || verification_failed?

    render json: { message: "Login success." }
  end

  def destroy
    render json: { message: "Logout success." }
  end

  private

  def session_params
    params.require(:session).permit(:login_id, :password)
  end

  def login_user
    User.find_by(login_id: session_params[:login_id])
  end

  def account_not_exist?
    login_user.blank?
  end

  def verification_failed?
    if login_user.authenticate(session_params[:password])
      false
    else
      true
    end
  end
end
