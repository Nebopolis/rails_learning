class TasksController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def index
		render json: {"tasks" => Task.all}
	end

	def create
		@task = Task.new(json_data['task'])
		if @task.valid?
			render json: {"task" => @task.save}
		else
			render :nothing => true, :status => 422
		end
	end

	def show
		@task = Task.find(params[:id])
		if @task
			render json: {"task" => @task}
		else
			render :nothing => true, :status => 404
		end
	end

	def update
		@task = Task.find(params[:id])
		data = json_data['task']
		@task.update(data)
		if @task
			data = json_data['task']
			@task.update(data)
			if @task.valid?
				render json: {"task" => @task.save}
			else
				render :nothing => true, :status => 422
			end
		else
			render :nothing => true, :status => 404
		end
	end

	def destroy
		@task = Task.find(params[:id])
		render json: {"task" => @task.delete()}
	end

	private
	def json_data
		request.body.rewind
		@json_data ||= JSON.parse(request.body.read)
	end
end
