# frozen_string_literal: true

class User < ApplicationRecord
  PASSWORD_FORMAT = /\A
    (?=.*\d)           # Must contain a digit
    (?=.*[a-z])        # Must contain a lower case character
    (?=.*[A-Z])        # Must contain an upper case character
  /x
  has_secure_password
  has_many :own_groups, class_name: 'Group', foreign_key: :owner_id, inverse_of: :owner
  has_many :expenses, as: :expenseable
  has_and_belongs_to_many :groups,-> { distinct }, inverse_of: :members, uniq: true
  validates :full_name, presence: true
  validates :password, format: { with: PASSWORD_FORMAT, message: 'must contain digits, lower and upper case characters' },
            presence: true, length: { in: 6..15 }, confirmation: true, if: -> { password.present? }

  validates :email, uniqueness: true, presence: true,
  format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number,:presence => true,on: %i[update],
            :numericality => true, uniqueness: true,
            :length => { :minimum => 10, :maximum => 15 }
end
