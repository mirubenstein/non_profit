class DonationsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:create]
  before_filter :authenticate_user!

  def create
    @donation = current_user.donations.create(nonprofit_id: params[:nonprofit_id])
    @donation.charge_card(token_params[:stripeToken])
    @nonprofit = Nonprofit.find(params[:nonprofit_id])
    redirect_to nonprofit_donation_path(@nonprofit, @donation)
  end

  def show
    @donation = Donation.find(params[:id])
  end

private
  def token_params
    params.permit(:stripeToken, :nonprofit_id)
  end
end
