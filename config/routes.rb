Rails.application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'
  root "jobs#index"
  # get "/jobs" => "jobs#index"
  # get "jobs/:id" => "jobs#show", as: :job
  # get "jobs/:id/edit" => "jobs#edit", as: :edit_job
  # patch "jobs/:id" => "jobs#update"
  
  get "jobs/:id/preview" => "jobs#preview", as: :preview_job
  resources :jobs, except: :destroy
end
