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

		@estates = Estate.where(nil) # creates an anonymous scope
  		@estates = @estates.state(@state) if @state
  		@estates = @estates.region(@region) if @region
  		@estates = @estates.bedrooms(@bedrooms) if @bedrooms
  		@estates = @estates.offer(@offer) if @offer
	end

	private

	def custom_estate_params
		@state = params[:state]
		@region = params[:region]
		@bedrooms = params[:bedrooms]
		@offer = params[:offer]
	
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

		if @offer == 'any'
			@offer = nil
		end
	end
end
