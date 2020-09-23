class Admins::SearchController < ApplicationController
	before_action :authenticate_admin!

	def search
		@model_type = params[:model_type]
		if  @model_type == '会員氏名'
			@customers = Customer.search(params[:content])
		else
			@items = Item.search(params[:content])
		end
	end
end
