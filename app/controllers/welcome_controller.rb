class WelcomeController < ApplicationController

	def index
		@msg = {} #header message
		@msg[:h1] = 'Welcome!'
		@msg[:h2] = 'We help you to find the best real estate offers from the whole United States!'
		@msg[:btn] = {:href => estate_index_path, :text=> 'Find Real Estate for Me!'}
		@img = '/main image.jpg'
	end
end
