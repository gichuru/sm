class SitesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @site = Site.all.order("created_at DESC")
  end

  def new
    @site = Site.new
  end

  def edit
  end

  def update

    respond_to do |format|
      if @site.update(site_params)
        format.html { redirect_to @site, notice: 'site was successfully updated.' }
        format.json { render :show, status: :ok, location: @site }
      else
        format.html { render :edit }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @site = Site.new(site_params)
    @site.user_id = current_user.id
    @site.save
    redirect_to @site
  end

def destroy
  @site= Site.find(params[:id])
    if @site.present?
  @site.destroy
    end
  respond_to do |format|
    format.html { redirect_to sites_url, notice: 'site was successfully destroyed.' }
    format.json { head :no_content }
  end
end


  def show
    @site = Site.find(params[:id])
    @space = @site.spaces.order("created_at DESC")
    @photo = Photo.where(space_id: @space.ids)
  end

  private
    def site_params
      params.require(:site).permit(:image, :name, :description,
                      :location, :email, :website, :phone, :city, :country, :user_id)
    end
end
