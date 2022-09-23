# frozen_string_literal: true

class ExpenseDebt < ApplicationRecord
  belongs_to :user
  belongs_to :expense
end
