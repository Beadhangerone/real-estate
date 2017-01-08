class EstateController < ApplicationController
	before_action :custom_estate_params, only: [:index] 

	def index
		define_head({
			h1: 'Find Estate!', 
			h2: 'Fill in the desired options below!',
		})

		@options = {
			states: ['New York', 'Los Angeles', 'California', 'Texas'],
			regions: {
				NY: ['NY 1', 'NY 2', 'NY 3', 'NY 4'],
				LA: ['LA 1', 'LA 2', 'LA 3', 'LA 4'],
				CA: ['CA 1', 'CA 2', 'CA 3', 'CA 4'],
				TX: ['TX 1', 'TX 2', 'TX 3', 'TX 4'],
			},
			bedrooms: ['1', '2', '3', '4', '5']
		}
		
		if @state and @region and @bedrooms
			@estates = Estate.where(state: @state, region: @region, bedrooms: @bedrooms)
		elsif @state and @region
			@estates = Estate.where(state: @state, region: @region)
		elsif @state and @bedrooms
			@estates = Estate.where(state: @state, bedrooms: @bedrooms)
		elsif @state
			@estates = Estate.where(state: @state)
		elsif @bedrooms
			@estates = Estate.where(bedrooms: @bedrooms)
		else 
			@estates = Estate.all
		end		
	end

	private

	def custom_estate_params
		@state = params[:state]
		@region = params[:region]
		@bedrooms = params[:bedrooms]
	
		if @state == 'Any'
			@state = nil
			@region = nil		
		end
		if @region == 'Any'
			@region = nil
		end
		if @bedrooms == 'Any'
			@bedrooms = nil
		end
	end
end
