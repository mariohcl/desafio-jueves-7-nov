class TaskcompletedsController < ApplicationController

def create

  @task = Task.find(params[:task_id])
  @taskcompleted = Taskcompleted.create(task: @task, user: current_user)

  if @taskcompleted
    redirect_to tasks_path, notice: "Completada"
  else
    redirect_to tasks_path, alert: "No Completada"
  end

end

def destroy

  @task = Task.find(params[:task_id])
  @taskcompleted = Taskcompleted.find_by(task: @task, user: current_user)

  if @taskcompleted.destroy
    redirect_to tasks_path, notice: "Cancelada"
  else
    redirect_to tasks_path, alert: "Error"
  end

end

end
