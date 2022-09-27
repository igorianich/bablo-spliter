# frozen_string_literal: true

class StatusController < ApplicationController
  def check
    # if session[:user_id]
    #   @user = User.find_by(id: session[:user_id])
    # end
    render './status_check'
  end
end
