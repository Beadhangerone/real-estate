class EstateController < ApplicationController
	def index
		@msg = {} #header message
		@msg[:h1] = 'Find Estate!'
		@msg[:h2] = 'Fill in your desired options below'

		state = params[:state]
		region = params[:region]
		bedrooms = params[:bedrooms]

		
		if state and region and bedrooms
			@estates = Estate.where(state: state, region: region, bedrooms: bedrooms)
		elsif state and region
			@estates = Estate.where(state: state, region: region)
		elsif state and bedrooms
			@estates = Estate.where(state: state, bedrooms: bedrooms)
		elsif state
			@estates = Estate.where(state: state)
		elsif bedrooms
			@estates = Estate.where(bedrooms: bedrooms)
		else 
			@estates = Estate.all
		end		
	end
end
