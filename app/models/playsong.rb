class Playsong < ActiveRecord::Base
belongs_to :song
belongs_to :playlist
end
