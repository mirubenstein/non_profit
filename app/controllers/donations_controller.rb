class DonationsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:create]
  before_filter :authenticate_user!

  def create
    @nonprofit = Nonprofit.find(params[:nonprofit_id])
    @user = current_user
    @donation = @user.donations.new(donation_params)
    @donation.nonprofit_id = @nonprofit.id
    @donation.save
    redirect_to nonprofit_donation_path(@nonprofit, @donation)
  end

  def show
    @donation = Donation.find(params[:id])
  end

private
  def donation_params
    params.require(:donation).permit(:token, :amount)
  end
end
