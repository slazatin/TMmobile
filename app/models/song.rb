class Song < ActiveRecord::Base
	has_many :playsongs
	has_many :playlists, through: :playsongs



	def self.google_image(query)
		result = GoogleImageApi.find( query, {
			:imgsz => "medium",
			:rsz => 8,
			:start => 1,
			})
		result.images.each do |img|
			puts img['url']
		end
	end

	def self.youtube(query)
		# Grabs the first 5 ids from the results of our youtube search
		youtube_results	= YoutubeSearch.search(query).map { |value| value["video_id"] }.take(8)
	end

end
