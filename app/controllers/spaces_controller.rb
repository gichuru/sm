class SpacesController < ApplicationController
  before_action :set_site, except: [:show, :index, :destroy]

  def index
    @space = Space.all
    # @photo = @space.photos.order("created_at DESC")
  end

  def new
    @space = Space.new
  end

  def edit

  end

  def create
    @space = Space.new(space_params)
    @space.site_id = @site.id
    @space.save
    redirect_to @space.site
  end

  def show
    @space = Space.find(params[:id])
    @photo = @space.photos.order("created_at DESC")
  end

  def destroy
    @space= Space.find(params[:id])
      if @space.present?
    @space.destroy
      end
    respond_to do |format|
      format.html { redirect_to spaces_url, notice: 'Space was successfully Deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_site
		@site = Site.find(params[:site_id])
	end
    def space_params
      params.require(:space).permit(:name, :accomodate, :description,
                      :qty, :photos, :price, :active)
    end
end
