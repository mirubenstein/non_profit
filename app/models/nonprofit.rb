class Nonprofit < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  has_many :donations
  has_many :users, through: :donations
end
