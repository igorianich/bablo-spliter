# frozen_string_literal: true

module V1
  class SessionsController < ApplicationController
    def new

    end

    def create
      user = User.find_by( email: params[:email])
      if user.present? && user.authenticate(params[:password])
        session[:user_id] = user.id
        session[:email] = user.email
        flash[:success] = 'Logged in successfuly'
        redirect_to root_path#, notice: 'Logged in successfuly'
      else
        flash[:alert] = 'Invalid email or password'
        render :new
      end
    end
    def destroy
      session[:user_id] = nil
      session[:email] = nil
      redirect_to root_path, notice: 'Logged out'
    end
  end
end
