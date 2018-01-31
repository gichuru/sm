class SpacesController < ApplicationController
  before_action :set_site
  def index
  end

  def new
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)
    @space.site_id = @site.id
    @space.save
    redirect_to @space
  end

  def show
    @space = Space.find(params[:id])

  end

  private

  def set_site
		@site = Site.find(params[:site_id])
	end
    def space_params
      params.require(:space).permit(:type,  :accomodate, :description,
                      :qty, :photos, :price, :active)
    end
end
