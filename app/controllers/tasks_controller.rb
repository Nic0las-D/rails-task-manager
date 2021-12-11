class TasksController < ApplicationController
  def index
    @tasks = Task.all
    # Le "tasks" est égal à tous les éléments du
    # Model "Task"
  end

  def new
    @task = Task.new
    # needed to instantiate the form_for
  end

  def show
    @task = Task.find(params[:id])
    # La task à afficher est égale aux
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)

    redirect_to task_path(@task)
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to tasks_path
  end
end
