# frozen_string_literal: true

class User < ApplicationRecord
  has_many :own_groups, class_name: 'Group', inverse_of: :owner
  has_many :expenses, as: :expenseable
  has_and_belongs_to_many :groups,-> { distinct }, inverse_of: :members, uniq: true
end
