Rails.application.routes.draw do
  mount Payola::Engine => '/payola', as: :payola
  # mount RedactorRails::Engine => '/redactor_rails'
  root "jobs#index"
  get "jobs/:id/preview" => "jobs#preview", as: :preview_job
  get "payments/:permalink" => "jobs#payment", as: :buy_ad
  post "payments/:permalink" => "payola/transactions#create"
  resources :jobs, except: :destroy
end