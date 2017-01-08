class EstateController < ApplicationController
	before_action :custom_estate_params, only: [:index] 

	def index
		define_head({
			h1: 'Find Estate!', 
			h2: 'Fill in the desired options below!',
		})
		
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
