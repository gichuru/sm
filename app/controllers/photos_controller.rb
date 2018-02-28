class PhotosController < ApplicationController
    before_action :set_space

    def index
        @photo = Photo.all
    end

    def new
      @photo = Photo.new
      # @photo = Photo.find(params[:id])
    end

    def create
  		@photo = @space.photos.build(photo_params)
      @photo.space_id = @space.id
  		@photo.save!
  		redirect_to @photo.space
    end

    def show
      @photo = Photo.find(params[:id])
    end

    private

    def set_space
  		@space = Space.find(params[:space_id])
  	end
      def photo_params
        params.require(:photo).permit(:image, :space_id)
      end
end
