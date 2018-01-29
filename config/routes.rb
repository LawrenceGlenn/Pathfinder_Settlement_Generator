Rails.application.routes.draw do

  get '/home' => 'settlements#home'
  get '/Contact' => 'settlements#contact'
  get '/MedievalStyle' => 'settlements#home'
  get '/TechStyle' => 'tech_settlements#home'
  #post '/home' => 'settlements#home'
  root 'settlements#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#map.search “search”, :controller => “search”
end
