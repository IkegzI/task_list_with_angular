Rails.application.routes.draw do
  get '/projects' => 'project#index'
  post '/todos' => 'project#create_task'
  patch '/project/:project_id/todos/:todo_id' => 'project#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
