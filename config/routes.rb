Rails.application.routes.draw do
  root 'welcome#index'
  get 'search', to: 'search#index'
  # base url is last-airbender-api.fly.dev
end
