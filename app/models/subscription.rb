class Subscription < ActiveRecord::Base
  belongs_to :nonprofit
  validates :amount, presence: true
  validates :interval, presence: true
  validates :long_name, presence: true
  validates :short_name, presence: true, uniqueness: true
  before_create :create_plan

private
  def create_plan
    Stripe.api_key = "sk_test_w3CCvv0csnbJams8XeOA9xKE"
    Stripe::Plan.create(
      :amount => 2000,
      :interval => self.interval,
      :name => self.long_name,
      :currency => self.currency,
      :id => self.short_name
    )
  end
end
