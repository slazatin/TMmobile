class ResultsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
    @song = Song.find(params[:id])
    @artistimg = Song.google_image("#{@song.artist} + #{@song.year}" )
    @cityimg = Song.google_image("#{@song.place} + #{@song.year} + 'photos'" )
    @fashionimg = Song.google_image("'getty images' + #{@song.year} + 'fashion'" )
    @artimg = Song.google_image("'getty images' + #{@song.year} + 'art'" )
    @filmimg = Song.google_image("'getty images' + #{@song.year} + 'film'" )
    @youtube = Song.youtube("#{@song.artist} + #{@song.year}" )
  end

  def destroy
  end
end
