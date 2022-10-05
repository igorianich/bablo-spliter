# frozen_string_literal: true
module V1
  class FriendsController < ApplicationController
    def index
      @friends = current_user.friends
      render friends: @friends
    end

  end
end
