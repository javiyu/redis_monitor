class TasksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :load_section
  after_action :reset_queue, only: [:create, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.create(task_params)
    redirect_to action: :index
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(task_params)
    redirect_to action: :index
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to action: :index
  end

  private
  def load_section
    @section = 'tasks'
  end

  def task_params
    params.require(:task).permit(:name, :type, :trigger, :database, :every, :status)
  end

  def reset_queue
    @task.reset_queue
  end
end