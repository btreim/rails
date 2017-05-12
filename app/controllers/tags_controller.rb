class TagsController < ApplicationController
	def index
		@tag = Tag.all
	end	

	def show
		@tag = Tag.find(params[:id])
	end

	before_filter :require_login, only: [:destroy]
	
	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy
		flash.notice = "'#{@tag.name}' Deleted!"
		redirect_to tags_path
	end

end
