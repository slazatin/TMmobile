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
		youtube_results
	end

	def self.rhapsody(query)
		# # If no movie specified, use The Matrix
		# movie ||= "matrix"

		# Authentication key for rotton tomatoes -- put yours in:
		# auth = { query: { apikey: 'beamLAJjCUmSdwJiPw9kFrJaYjHEU7ny', q: movie }} # Adds to end of URL ?apikey=<YOURKEY>&q=<MOVIE>
		search_url = "http://api.rhapsody.com/v1/search/typeahead?apikey=FF3m3Ux0fES32FFvc08QMY1xRH6XGOgn&q=#{query}&type=artist"



		response = HTTParty.get search_url
		# response = HTTParty.get search_url, auth
		response

		# response.parsed_response["movies"]

		# auth = { query: { apikey: 'pjz23qq9uhq7tfwzd7r7xw9r' }}
		
		# id = # INSERT CODE HERE: Get the value of 'movies' 0 'id' in the nested response hash
		# 		 # HINT: It should be something like this: response['stuff'][1]['morestuff']
		# movie_url = "http://api.rottentomatoes.com/api/public/v1.0/movies/#{id}.json"

		# response = HTTParty.get movie_url, auth
	
	end 

	def self.getty(search)

		auth = {headers: {'Api-Key'=>"eh88967e94ehv2vm7rgggfb5"}}
		search_url ="https://connect.gettyimages.com:443/v3/search/images/editorial?phrase=#{search}&fields=detail_set&editorial_segments=archival&sort_order=most_popular"


		#"https://connect.gettyimages.com/v3/search/images/editorial?phrase=#{search}"

		# curl -i -H "Api-Key:eh88967e94ehv2vm7rgggfb5" "https://connect.gettyimages.com/v3/search/images?phrase=Beck"
		response = HTTParty.get search_url, auth
		response.parsed_response["images"]


	
	end


end
