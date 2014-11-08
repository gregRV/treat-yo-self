class TreatsController < ApplicationController
	def new
		@user = current_user
		@treat = current_user.treats.new
	end

	def create
		@user = current_user
		@treat = current_user.treats.new(treat_params)
		if @treat.save
			flash[:notice] = 'Successfully created Treat'
			redirect_to user_treat_path(@user, @treat) and return
		else
			flash[:notice] = 'Failed to create Treat'
			render :new
		end
	end

	def show
		@treat = Treat.find(params[:id])
	end

	private

	def treat_params
		params.require(:treat).permit(:title, :description, :price, :img_url)
	end
end
