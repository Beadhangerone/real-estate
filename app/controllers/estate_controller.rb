class EstateController < ApplicationController
	before_action :custom_estate_params, only: [:index]

	def index
		@msg = {} #header message
		@msg[:h1] = 'Find Estate!'
		@msg[:h2] = 'Fill in your desired options below'
		
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
		if params[:state] == 'Any'
			@state = nil
			@region = nil
		else
			@state = params[:state]		
		end
		if params[:region] == 'Any'
			@region = nil
		else
			@region =params[:region]
		end

		if params[:bedrooms] == 'Any'
			@bedrooms = nil
		else
			@bedrooms = params[:bedrooms]
		end
	end
end
