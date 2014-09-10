class NonprofitsController < ApplicationController
  def index
    @nonprofits = Nonprofit.all
  end

  def show
    @nonprofit = Nonprofit.find(params[:id])
    @donation = Donation.new
  end

  def new
    @nonprofit = Nonprofit.new
  end

  def create
    @nonprofit = Nonprofit.new(nonprofit_params)
    if @nonprofit.save
      flash[:notice] = "Saved!"
      redirect_to nonprofit_path(@nonprofit)
    else
      render 'new'
    end
  end

  def edit
    @nonprofit = Nonprofit.find(params[:id])
  end

  def update
    @nonprofit = Nonprofit.find(params[:id])
    if @nonprofit.update(nonprofit_params)
      flash[:notice] = "Updated!"
      redirect_to nonprofit_path(@nonprofit)
    else
      render 'edit'
    end
  end

  def destroy
    @nonprofit = Nonprofit.find(params[:id])
    @nonprofit.destroy
    redirect_to nonprofits_path
  end

private
  def nonprofit_params
    params.require(:nonprofit).permit(:name)
  end
end
