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
        session[:email] = @user.email
        redirect_to root_path, notice: 'Successfully created account'
      else
        flash[:alert] = 'Something went wrong'
        render :new
      end
    end

    def show
      @user = current_user
    end

    def edit
      @user = current_user
    end

    def update
      if (@user = current_user).update(update_params)
        flash[:success] = 'Account data is successfully updated'
        redirect_to profile_path, notice: 'Account data is successfully updated '
      else
        flash[:alert] = 'Something went wrong'
        render :edit, user: @user
      end
    end

    def sign_up_params
      params.require(:user).permit(
        :email, :full_name, :phone_number, :password, :password_confirmation
      ).to_h.symbolize_keys
    end
    def update_params
      params.require(:user).permit(:email, :full_name, :phone_number).to_h.symbolize_keys
    end
  end
end

