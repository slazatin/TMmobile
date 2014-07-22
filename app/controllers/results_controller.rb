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
    @cityimg = Song.google_image("#{@song.place} + 'City' + #{@song.year}" )
    @fashionimg = Song.google_image("'getty images' + #{@song.year} + 'fashion getty images'" )
    @artimg = Song.google_image("'getty images' + #{@song.year} + 'art'" )
    @filmimg = Song.google_image("'getty images' + #{@song.year} + 'film music poster'" )
    @youtube = Song.youtube("#{@song.artist} + #{@song.year}" )
  end

  def destroy
  end
end
