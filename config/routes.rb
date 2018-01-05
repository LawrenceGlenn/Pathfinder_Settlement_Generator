Rails.application.routes.draw do

  get '/home' => 'settlements#home'
  #post '/home' => 'settlements#home'
  root 'settlements#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#map.search “search”, :controller => “search”
end
