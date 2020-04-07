class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: {case_sensitive: false }
  validates :icon, presence: true
  before_save :titlelize_name
  belongs_to :user
  has_many :transactions

  private
  def titlelize_name
    self.name = self.name.split.collect(&:capitalize).join(' ') if self.name && !self.name.blank?
  end
end
