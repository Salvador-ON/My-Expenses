class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  validates_presence_of :avatar
  validates :name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups
  has_many :transactions
end
