class TasksController < ApplicationController
	def index
		render json: Task.all
	end
	def create
		@task = Task.new(params[:task])
	end
end
