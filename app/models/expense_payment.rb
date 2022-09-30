# frozen_string_literal: true

class ExpensePayment < ApplicationRecord
  belongs_to :user
  belongs_to :expense
end
