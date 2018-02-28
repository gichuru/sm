class SpacesController < ApplicationController
  before_action :set_site, except: [:show]

  def index
    # @spaces = current_user.spaces
  end

  def new
    @space = Space.new
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

  private

  def set_site
		@site = Site.find(params[:site_id])
	end
    def space_params
      params.require(:space).permit(:name, :accomodate, :description,
                      :qty, :photos, :price, :active)
    end
end
