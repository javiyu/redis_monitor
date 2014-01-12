class TasksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :load_section

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
    Task.create(task_params)
    redirect_to action: :index
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to action: :index
  end

  private
  def load_section
    @section = 'tasks'
  end

  def task_params
    params.require(:task).permit(:name, :type, :value, :every)
  end
end