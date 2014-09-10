class SubscriptionsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]

  def index
    @nonprofit = Nonprofit.find(params[:nonprofit_id])
  end

  def show
    @subscription = Subscription.find(params[:id])
  end

  def new
    @nonprofit = Nonprofit.find(params[:nonprofit_id])
    @subscription = @nonprofit.subscriptions.new
  end

  def create
    @nonprofit = Nonprofit.find(params[:nonprofit_id])
    @subscription = @nonprofit.subscriptions.new(subscription_params)
    if @subscription.save
      flash[:notice] = "Subscription created!"
      redirect_to nonprofit_subscription_path(@nonprofit, @subscription)
    else
      render 'new'
    end
  end

private
  def subscription_params
    params.require(:subscription).permit(:short_name, :long_name, :amount, :interval, :currency)
  end
end
