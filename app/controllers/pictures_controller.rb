class PicturesController < ApplicationController
	def index
		@pictures = Picture.all
	end

	def show
    @picture = Picture.find(params[:id])
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