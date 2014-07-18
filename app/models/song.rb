class Song < ActiveRecord::Base
	has_many :playsongs
	has_many :playlists, through: :playsongs

end
