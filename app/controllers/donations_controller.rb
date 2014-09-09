class DonationsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    @donation = Donation.create(nonprofit_id: params[:nonprofit_id])
    @donation.charge_card(token_params[:stripeToken])
    @nonprofit = Nonprofit.find(params[:nonprofit_id])
    redirect_to nonprofit_donation_path(@nonprofit, @donation)
  end

  def show
    @donation = Donation.find(params[:id])
  end

private
  def token_params
    params.permit(:stripeToken)
  end
end
