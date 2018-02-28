class SitesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @site = Site.all.order("created_at DESC")
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    @site.user_id = current_user.id
    @site.save
    redirect_to @site
  end

  def show
    @site = Site.find(params[:id])
    @space = @site.spaces.order("created_at DESC")
  end

  private
    def site_params
      params.require(:site).permit(:image, :name, :description,
                      :location, :email, :website, :phone, :user_id)
    end
end
