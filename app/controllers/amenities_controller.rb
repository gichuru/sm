class AmenitiesController < ApplicationController
  # before_action :set_site

  def index
    @amenity = Amenity.all
  end

  def new
    @amenity = Amenity.new
  end

  def create
    @amenity = Amenity.new(amenity_params)
    @amenity.save
    redirect_to 'new'
  end

  def show
    @amenity = Amenity.find(params[:id])

  end

  private

  # def set_site
	# 	@site = Site.find(params[:site_id])
	# end
    def amenity_params
      params.require(:amenity).permit(:name,)
    end
end
