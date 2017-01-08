class WelcomeController < ApplicationController

	def index
		define_head({
			h1: 'Welcome!', 
			h2: 'We help you to find the best real estate offers in all of the United States!',
			btn: {:href => estate_index_path, :text=> 'Find Real Estate for Me!'},
			img: '/main image.jpg'
		})
		
	end
end
