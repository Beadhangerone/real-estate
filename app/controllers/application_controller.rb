class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  	private

  	def define_head (params)
  		@msg = {} #header message
		@msg[:h1] = params[:h1] if params[:h1]
		@msg[:h2] = params[:h2] if params[:h2]
		@msg[:btn] = {:href => params[:btn][:href], :text=> params[:btn][:text]} if params[:btn]
		@img = params[:img] if params[:img]
	end
end
