class User < ApplicationRecord
  validates :firstname, :lastname, presence: true
  validates :lastname, length: {in: 2..20}
  validates :firstname,length: {maximum: 10, too_long: " - %{count} characters is the maximum allowed."}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password,length: {minimum: 6, too_shot: " - %{count} characters is the minimu allowed."}

  has_many :pictures
end
