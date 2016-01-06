class TasksController < ApplicationController
	before_action :authenticate_user!
	before_action :set_task, only: [:show, :edit, :update, :destroy, :mark, :unmark]

	respond_to :html

	def index
		@tasks = Task.all
		@myTasks = current_user.assigned_tasks
		@myCreatedTasks = current_user.tasks
	end

	def show
		respond_with(@task)
	end

	def new
		@task = Task.new
		respond_with(@task)
	end

	def edit
	end

	def create
		@task = Task.new(task_params)
		@task.creator = current_user
		@task.save
		redirect_to action: "index"
	end

	def update
		@task.update(task_params)
		redirect_to action: "index"
	end

	def destroy
		@task.destroy
		respond_with(@task)
	end

	def mark
		@task.finished_on = DateTime.now
		@task.save!
		redirect_to action: "index"
	end

	def unmark
		@task.finished_on = nil
		@task.save!
		redirect_to action: "index"
	end

	private
		def set_task
			@task = Task.find(params[:id])
		end

		def task_params
			params.require(:task).permit(:name, :description, :finished_on, :assignee_id, :reward)
		end
end
