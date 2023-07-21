# frozen_string_literal: true

class Api::Admin::SessionsController < ApplicationController
  before_action :authorize_request, except: :create

  def create
    @user = User.find_by_email(login_params[:email])
    if @user&.authenticate(login_params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      render_json(token)
    else
      render json: { error: 'Incorrect login information. Please try again.' }, status: :unauthorized
    end
  end

  private

  def render_json(token)
    time = Time.now + 24.hours.to_i
    render json: { token:,
                   exp: time.strftime('%m-%d-%Y %H:%M'),
                   email: @user.email,
                   id: @user.id,
                   full_name: @user.full_name },
           status: :ok
  end

  def login_params
    params.require(:session).permit(%w[email password])
  end
end
