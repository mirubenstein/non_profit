class DonationsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    # Set your secret key: remember to change this to your live secret key in production
    # See your keys here https://dashboard.stripe.com/account
    Stripe.api_key = "sk_test_w3CCvv0csnbJams8XeOA9xKE"

    # Get the credit card details submitted by the form
    token = token_params[:stripeToken]

    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => 1000, # amount in cents, again
        :currency => "usd",
        :card => token,
        :description => "payinguser@example.com"
      )
    rescue Stripe::CardError => e
      # The card has been declined
    end
    @donation = Donation.create(amount: charge.amount, email: charge.description, nonprofit_id: params[:nonprofit_id])
    redirect_to nonprofit_donation_path(@donation)
  end

private
  def token_params
    params.permit(:stripeToken)
  end
end
