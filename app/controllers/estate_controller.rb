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

		# if not region and bedrooms
		# 	@estates = Estate.where(state: state)
		# elsif not bedrooms
		# 	@estates = Estate.where(state: state, region: region)
		# elsif not region
		# 	@estates = Estate.where(state: state, bedrooms: bedrooms)
		# else
		# 	@estates = Estate.where(state: state, region: region, bedrooms: bedrooms)
		# end



		# if region == 'Any' and bedrooms == 'Any'
		# 	@estates = Estate.where(state: state)
		# elsif bedrooms == 'Any'
		# 	@estates = Estate.where(state: state, region: region)
		# elsif region == 'Any'
		# 	@estates = Estate.where(state: state, bedrooms: bedrooms)
		# else
		# 	@estates = Estate.where(state:state, region: region, bedrooms: bedrooms)
		# end
	end
end
