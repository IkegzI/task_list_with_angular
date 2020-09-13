class ProjectController < ApplicationController
  def index
    projects = Project.all
    arr = []
    projects.each do |project|
      hash = {}
      hash[:id] = project.id
      hash[:title] = project.title
      hash[:todos] = []
      project.tasks.each do |task|
        t = {}
        t[:id] = task.id
        t[:text] = task.text
        t[:isCompleted] = task.isCompleted
        hash[:todos] << t
      end
      arr << hash
    end
    render json: arr.to_json, status: :ok

  end

  def update
    param = params_update
    todo = Task.find(param[:todo_id].to_i)
    todo.update(isCompleted: !todo.isCompleted)
  end



  def create
    task_errors = []
    data = params_require
    data.each do |arr|

      if arr[:id].to_i.present?
        project = Project.find(arr[:id].to_i)
        if arr[:title] != project.title
          project.update(title: arr[:title])
        end
      else
        project = Project.create(title: arr[:title])
      end

      arr[:todos].each do |task|
        task = Task.new(task.permit(:text, :isCompleted))
        task.project = project
        task.save
      end

    end
  end

  def create_task
    Task.create(params_task)
  end


  private


  def params_require
    params.require(:projects)
  end

  def params_update
    params.permit(:project_id, :todo_id)
  end

  def params_task
    params.require(:task).permit(:text, :isCompleted)
  end
end
