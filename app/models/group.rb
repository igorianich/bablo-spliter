# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id, inverse_of: :own_groups
  has_many :expenses, as: :expenseable
  has_and_belongs_to_many :members, -> { distinct }, class_name: 'User', association_foreign_key: :user_id, inverse_of: :groups
  after_create :add_owner_as_member

  private

  def add_owner_as_member
    members << owner
  end
end
