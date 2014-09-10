class Donation < ActiveRecord::Base
  belongs_to :nonprofit
  belongs_to :user

  def charge_card(stripe_token)
    # Set your secret key: remember to change this to your live secret key in production
    # See your keys here https://dashboard.stripe.com/account
    Stripe.api_key = "sk_test_w3CCvv0csnbJams8XeOA9xKE"

    # Get the credit card details submitted by the form


    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => 1000, # amount in cents, again
        :currency => "usd",
        :card => stripe_token,
        :description => "payinguser@example.com"
      )
      self.update(amount: charge.amount, email: charge.description)
    rescue Stripe::CardError => e
      # The card has been declined
    end
  end
end
