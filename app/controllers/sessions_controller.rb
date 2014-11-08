class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(email: params[:email])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to @user, notice: 'Login Successful' and return
		else
			flash[:alert] = 'Login Failed'
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to new_session_path, notice: 'Logged Out'
	end
end
