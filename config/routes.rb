Rails.application.routes.draw do
  resources 'users', only: [:new, :create, :show]
  resource 'session', only: [:new, :create, :destroy]
  resources 'bands' do
    resources 'albums', only: [:new]
  end
  resources 'albums', except: [:new, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
