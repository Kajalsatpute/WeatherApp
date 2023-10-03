Rails.application.routes.draw do
  get 'weather/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "weather#get_weather"
  get 'weather', to: 'weather#get_weather'
end
