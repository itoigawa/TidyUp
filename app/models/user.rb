class User < ApplicationRecord
  include JwtToken
  authenticates_with_sorcery!

  has_many :items, dependent: :destroy
  has_many :wearing_times, dependent: :destroy

  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
end
