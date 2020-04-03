class Transaction < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true
  belongs_to :user
  belongs_to :group, optional: true
end
