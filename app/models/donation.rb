class Donation < ActiveRecord::Base
  belongs_to :nonprofit
  belongs_to :user
  before_save :multiply_amount
  before_create :charge_card

private

  def multiply_amount
    self.amount = self.amount * 100
  end

  def charge_card
    begin
      Stripe.api_key = "sk_test_w3CCvv0csnbJams8XeOA9xKE"
      charge = Stripe::Charge.create(
        :amount => self.amount, # amount in cents, again
        :currency => "usd",
        :card => self.token,
        :description => self.user.email
      )
    rescue Stripe::CardError => e
      # The card has been declined
    end
  end
end
