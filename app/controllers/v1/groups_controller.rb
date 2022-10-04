# frozen_string_literal: true

module V1
  class GroupsController < ApplicationController
    before_action :set_group, only: %i[show new_expense]
    def index
      @groups = current_user.groups
      render groups: @groups
    end

    def show
      render group: @group
    end

    def new
      @group = Group.new
    end

    def create
      @group = current_user.own_groups.new(group_params)
      if @group.save
        flash[:success] =  'Group was created'
        redirect_to @group, notice: 'Group was created'
      end
    end

    def new_expense
      @expenseable = @group

    end

    private

    # attr_accessor :groups
    def set_group
      @group = Group.find_by(id: params[:id])
    end

    def group_params
      params.require(:group).permit(:name, :group_type).to_h.symbolize_keys
    end
  end
end
