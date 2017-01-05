class EstateController < ApplicationController
	def index
		state = params[:state]
		region = params[:region]
		bedrooms = params[:bedrooms]
		
		if state and region
			@estates = Estate.where(state: state, region: region)
		elsif state and bedrooms
			@estates = Estate.where(state: state, bedrooms: bedrooms)
		elsif state
			@estates = Estate.where(state: state)
		end		
	end
end
