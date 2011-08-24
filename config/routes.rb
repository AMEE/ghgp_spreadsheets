ActionController::Routing::Routes.draw do |map|
  
  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.login "/login", :controller=>'user_sessions',:action=>'new'
  map.resources :users
  map.resource :user_session

  map.report "/report", :controller=>'calculation',:action=>'report'
  map.update 'calculations/update/:id',:controller=>'calculation',:action=>'update'
  map.calculation 'calculations/:type',:controller=>'calculation',:action=>'calculation'
  map.delete 'calculations/delete/:id/',:controller=>'calculation',:action=>'delete'
  map.add '/calculation/add/:type', :controller => 'calculation', :action=>'add'
  map.sort '/calculation/:type/sort', :controller => 'calculation', :action=>'sort'
  map.toggle_optional '/calculation/:type/toggle_optional', :controller => 'calculation', :action=>'toggle_optional'
  map.summary '/summary',:controller => 'calculation', :action => 'summary'
  map.totals_chart "totals/update",:controller => 'calculation', :action => 'update_totals'
  map.help "/help", :controller => 'application', :action=> 'help'
  map.root :controller => 'application', :action=> 'home'

end
