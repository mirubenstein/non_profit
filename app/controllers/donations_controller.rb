class DonationsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:create]
  before_filter :authenticate_user!

  def create
    @user = current_user
    @donation = Donation.new(amount: donation_params[:amount], nonprofit_id: params[:nonprofit_id], token: donation_params[:stripeToken], user_id: @user.id)
    @donation.save
    @nonprofit = Nonprofit.find(params[:nonprofit_id])
    redirect_to nonprofit_donation_path(@nonprofit, @donation)
  end

  def show
    @donation = Donation.find(params[:id])
  end

private
  def donation_params
    params.permit(:stripeToken, :nonprofit_id)
  end
end
