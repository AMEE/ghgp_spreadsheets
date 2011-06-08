ActionController::Routing::Routes.draw do |map|
  
  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.

  map.update 'calculations/update',:controller=>'calculation',:action=>'update'
  map.index 'calculations/:type',:controller=>'calculation',:action=>'index'
  map.delete 'calculations/delete/:id/',:controller=>'calculation',:action=>'delete'
  map.add '/calculation/add/:type', :controller => 'calculation', :action=>'add'
  map.test '/test',:controller => 'calculation', :action => 'test'
  map.root :controller => 'calculation', :action=>'index'

end
