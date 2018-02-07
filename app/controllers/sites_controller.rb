class SitesController < ApplicationController

  def index
    @sites = Site.all.order("created_at DESC")
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    @site.save
    redirect_to @site
  end

  def show
    @site = Site.find(params[:id])
    @space = @site.spaces.order("created_at DESC")
  end

  private
    def site_params
      params.require(:site).permit(:logo, :name, :description,
                      :location, :email, :website, :phone)
    end
end
