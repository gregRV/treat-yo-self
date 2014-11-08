class TasksController < ApplicationController
	def new
		@user = current_user
		@task = @user.tasks.new
	end

	def create
		@task = current_user.tasks.new(task_params)
		if @task.save
			redirect_to user_task_path(@task.user, @task), notice: 'Successfully created Task!' and return
		end
		flash[:notice] = 'Failed to create Task'
		render :new
	end

	def show
		@task = Task.find(params[:id])
	end

	private

	def task_params
		params.require(:task).permit(:title, :description, :reward)
	end
end
