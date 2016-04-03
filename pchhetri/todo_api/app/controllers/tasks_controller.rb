class TasksController < ApplicationController
	skip_before_filter :verify_authenticity_token
    def index
        render json: @tasks = Task.all
    end

    def show
    	@task = Task.find(params[:id])
    	render json: @task
    end

    def create
	    @task = Task.new(json_data['task'])
	    @task.save
	    render json: @task
	end

	def update
		@task = Task.find(params[:id])
		@task.update(json_data['task'])
		@task.save
		render json: @task
	end

	def destroy
		@task = Task.find(params[:id])
		render json: @task.delete()
	end

	private
	def json_data
		request.body.rewind
		@json_data ||= JSON.parse(request.body.read)
	end
end