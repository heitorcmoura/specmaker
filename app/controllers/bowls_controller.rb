class BowlsController < ApplicationController
 before_filter :load_specsheet

 def new
 	@bowl = Bowl.new
 end

 def create
 	@bowl = Bowl.find(params[:id])
		if @bowl.update_attributes(bowl_params)
			redirect_to bowl_path(@bowl)
		else
			render :new
		end
 end

	def edit
		@bowl = Bowl.find(params[:id])
	end

	def update
		@bowl = Bowl.find(params[:id])
		if @bowl.update_attributes(bowl_params)
			redirect_to specsheet_specsheet_steps_path(@specsheet)
		else
			render :edit
		end
	end

	def delete
		@bowl = Bowl.find(params[:id])
		@bowl.destroy
		redirect_to bowls_path
	end

	private
	def bowl_params
		params.require(:bowl).permit(:id, :left_right, :front_back, :depth, :bottom_grid, :colander, :specsheet_id)
	end

	def load_specsheet
		@specsheet = Specsheet.find(params[:specsheet_id])
	end
end