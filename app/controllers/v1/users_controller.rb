# frozen_string_literal: true

module V1
  class UsersController < ApplicationController
    def new
      @user = User.new
    end

    def create
      @user = User.new(sign_up_params.except(:confirm_password))
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path, notice: 'Successfully created account'
      else
        flash[:alert] = 'Something went wrong'
        render :new
      end
    end

    def sign_up_params
      params.require(:user).permit(
        :email, :full_name, :phone_number, :password, :password_confirmation
      ).to_h.symbolize_keys
    end
  end
end

