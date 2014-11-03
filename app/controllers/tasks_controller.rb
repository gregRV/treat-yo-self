class TasksController < ApplicationController
	def new
		@user = current_user
		@task = @user.tasks.new
	end

	def create
		@task = current_user.tasks.create(task_params)
		redirect_to user_task_path(@task.user, @task)
	end

	def show
		@task = Task.find(params[:id])
	end

	private

	def task_params
		params.require(:task).permit(:title, :description, :reward)
	end
end
