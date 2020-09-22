class Admins::SearchController < ApplicationController
	before_action :authenticate_admin!

	def search
		range = .where("submit_name = ?", params[:submit_name]) .pluck(:id)
end
