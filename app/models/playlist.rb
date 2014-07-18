class Playlist < ActiveRecord::Base
	has_many :playsongs
	has_many :songs, through: :playsongs
end
