class Subscription < ActiveRecord::Base
  belongs_to :nonprofit
  validates :amount, presence: true
  validates :interval, presence: true
  validates :long_name, presence: true
  validates :short_name, presence: true
end
