class PlaylistsController < ApplicationController
  def index
  	@playlists = Playlist.all
  	@search = Song.rhapsody("Rancid")
  end

  def show
  	@playlist = Playlist.find(params[:id])
  end
end
