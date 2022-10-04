# frozen_string_literal: true

module V1
  class ExpensesController < ApplicationController
    before_action :set_expense, only: %i[show]

    def index
      render expenses: @expenses
    end
    def show
      render expense: @expense
    end

    def new
      @expense = Expense.new
    end

    def create
      @expense = Group.find_by(id: params[:group_id]).expenses.new(expense_params)
      if @expense.save
        flash[:success] = 'Expense was added'
        redirect_to @expense
      end
    end

    private

    # attr_accessor :expenses
    def set_expense
      @expense = Group.find_by(id: params[:id])
    end

    def expense_params
      params.require(:expense).permit(:title, :total, :date_time, :description).to_h.symbolize_keys
    end
  end
end
