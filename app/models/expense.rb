# frozen_string_literal: true

class Expense < ApplicationRecord
  belongs_to :expenseable, polymorphic: true
  has_many :expense_payments
  has_many :expense_debts
end
