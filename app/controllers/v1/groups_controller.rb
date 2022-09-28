# frozen_string_literal: true

module V1
  class GroupsController < ApplicationController
    before_action :set_group, only: %i[show]
    def index
      @groups = current_user.groups
      render groups: @groups
    end

    def show
      render group: @group
    end

    private

    # attr_accessor :groups
    def set_group
      @group = Group.find_by(id: params[:id])
    end
  end
end
