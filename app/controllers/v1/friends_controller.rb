# frozen_string_literal: true
module V1
  class FriendsController < ApplicationController
    before_action :set_friend, only: %i[show destroy]
    def index
      @friends = current_user.friends
      render friends: @friends
    end

    def show
      authorize @friend, policy_class: FriendPolicy
    end

    def new
      @friend =
        if search_params[:email].present?
          User.where("email LIKE ?", "%" + search_params[:email] + "%").first || 'User not found, please check is email correct'
        else
          nil
        end
      render friend: @friend
    end

    def add
      @friend = User.find_by(id: user_params[:id])
      if current_user.add_friend(@friend)
        flash[:notice] = 'Friend was added'
        render :new, friend: @friend = nil
      else
        flash[:alert] = 'Friend is already added'
        render :new, friend: @friend = nil
      end
    end

    def destroy
      current_user.friends.delete(@friend)
      flash[:notice] = 'Friend was deleted'
      render :index
    end

    private

    def search_params
      params.fetch(:friend, {}).permit(:email)
    end

    def user_params
      params.require(:friend).permit(:id)
    end

    def set_friend
      @friend = User.find_by(id: params[:id])
    end
  end
end
