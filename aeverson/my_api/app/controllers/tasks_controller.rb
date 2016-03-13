class TasksController < ApplicationController
	skip_before_filter :verify_authenticity_token
	def index
		render json: Task.all
	end
	def create
		@task = Task.new(json_data['task'])
		@task.save
		render json: @task
	end
	private
	def json_data
		request.body.rewind
		@json_data ||= JSON.parse(request.body.read)
	end
end