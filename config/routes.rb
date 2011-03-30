ActionController::Routing::Routes.draw do |map|
  
   map.root :controller => "calculation",:action=>'index'

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect 'calculations',:controller=>'calculation',:action=>'index'
  map.connect 'calculations/:calculation',:controller=>'calculation',:action=>'enter'
  map.connect 'calculations/:calculation/result',:controller=>'calculation',:action=>'result'
  map.connect 'calculations/:calculation/:uid/',:controller=>'calculation',:action=>'edit'
  map.connect 'config',:controller=>'config',:action=>'show'
  map.root :controller => 'calculation', :action=>'index'
end
