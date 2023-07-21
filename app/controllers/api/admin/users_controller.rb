# frozen_string_literal: true

class Api::Admin::UsersController < ApplicationController
  before_action :authorize_request, except: :create

  def index
    render_response(User.all)
  end

  def show
    render_response(user)
  end

  def update
    if user.update(permitted_params)
      render_response(user)
    else
      render_error
    end
  end

  def create
    new_user = User.new(permitted_params)
    if new_user.save
      render_response(new_user)
    else
      render_error
    end
  end

  def destroy
    if user.destroy
      render json: { message: 'destroyed', status: 200 }
    else
      render_error
    end
  end

  private

  def user
    @user ||= User.find(params[:id])
  end

  def permitted_params
    params.require(:user).permit(%w[first_name last_name password email])
  end

  def render_error
    render json: { error: user.errors.full_messages }
  end

  def render_response(obj)
    render json: obj.to_json(except: [:password_digest])
  end
end
