class PhotosController < ApplicationController
    before_action :set_space, except: [:destroy]

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

    def destroy
      @photo = Photo.find(params[:id])
        if @photo.present?
      @photo.destroy
        end
      respond_to do |format|
        format.html { redirect_to spaces_url, notice: 'Photo was successfully Deleted.' }
        format.json { head :no_content }
      end
    end

    private

    def set_space
  		@space = Space.find(params[:space_id])
  	end
      def photo_params
        params.require(:photo).permit(:image, :space_id)
      end
end
