class PicturesController < ApplicationController
	def index
		@pictures = Picture.all
	end

	def show
    @picture = Picture.find(params[:id])
  	end

  	def new 
  		@picture = Picture.new
  	end

  	def create
  		@picture = Picture.new(picture_params)
  		if @picture.save
  			redirect_to pictures_url
  		else
  			render :new
  	end

def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    if @picture.update_attributes(picture_params)
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end
end

private
	def picture_params
		params.require(:picture).permit(:artist, :title, :url)
	end
end

class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :artist
      t.string :title
      t.string :url

      t.timestamps null: false
    end
  end
end