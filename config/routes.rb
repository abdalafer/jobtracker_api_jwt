Rails.application.routes.draw do
  get '/customers' => 'customers#index'
  get '/customer/:uuid/jobs' => 'customers#jobs'
  get '/job/:uuid/job_tasks' => 'jobs#job_tasks'
  get '/job_task/:uuid' => 'job_tasks#show'

  post '/customer' => 'customers#create'
  post '/job' => 'jobs#create'
  post '/job_task' => 'job_tasks#create'

  post '/job_task/:uuid/start' => 'job_tasks#update', job_task: {state: :started}
  post '/job_task/:uuid/finish' => 'job_tasks#update', job_task: {state: :finished}
  delete '/job_task/:uuid' => 'job_tasks#destroy'

  resources :users
  post '/users/login' => 'users#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
