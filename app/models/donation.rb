class Donation < ActiveRecord::Base
  belongs_to :nonprofit
  belongs_to :user
  before_create :charge_card

private
  def charge_card
    binding.pry
    begin
      Stripe.api_key = "sk_test_w3CCvv0csnbJams8XeOA9xKE"
      charge = Stripe::Charge.create(
        :amount => 1000, # amount in cents, again
        :currency => "usd",
        :card => self.token,
        :description => self.user.email
      )
    rescue Stripe::CardError => e
      # The card has been declined
    end
  end
end
