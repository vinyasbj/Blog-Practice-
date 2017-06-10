class AdvertisersController < ApplicationController
  before_action :set_advertiser, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @advertisers = Advertiser.all
    respond_with(@advertisers)
  end

  def show
    respond_with(@advertiser)
  end

  def new
    @advertiser = Advertiser.new
    respond_with(@advertiser)
  end

  def edit
  end

  def create
    @advertiser = Advertiser.new(advertiser_params)
    @advertiser.save
    respond_with(@advertiser)
  end

  def update
    @advertiser.update(advertiser_params)
    respond_with(@advertiser)
  end

  def destroy
    @advertiser.destroy
    respond_with(@advertiser)
  end

  private
    def set_advertiser
      @advertiser = Advertiser.find(params[:id])
    end

    def advertiser_params
      params.require(:advertiser).permit(:name)
    end
end
