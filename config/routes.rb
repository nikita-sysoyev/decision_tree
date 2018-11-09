Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :actions, except: %i(edit new)
      get  'objects/fetch_tree'
      post 'objects/check_object'
    end
  end
end
