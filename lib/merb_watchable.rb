if defined?(Merb::Plugins)

  $:.unshift File.dirname(__FILE__)

  dependency 'merb-slices', :immediate => true
  Merb::Plugins.add_rakefiles "merb_watchable/merbtasks", "merb_watchable/slicetasks", "merb_watchable/spectasks"
  
  require 'dm-core'
  require 'dm'/'watch'
  require 'dm'/'dm_watchable'
  
  # Include Watchable in DataMapper::Resource
  module DataMapper
    module Resource
      module ClassMethods
        include MerbWatchable::DataMapper::Is::Watchable
      end # module ClassMethods
    end # module Resource
  end # module DataMapper

  # Register the Slice for the current host application
  Merb::Slices::register(__FILE__)
  
  # Slice configuration - set this in a before_app_loads callback.
  # By default a Slice uses its own layout, so you can swicht to 
  # the main application layout or no layout at all if needed.
  # 
  # Configuration options:
  # :layout - the layout to use; defaults to :merb_watchable
  # :mirror - which path component types to use on copy operations; defaults to all
  Merb::Slices::config[:merb_watchable][:layout] ||= :merb_watchable
  
  # All Slice code is expected to be namespaced inside a module
  module MerbWatchable
    
    # Slice metadata
    self.description = "MerbWatchable sends you emails when your stuff is modified."
    self.version = "0.0.1"
    self.author = "Liam Morley"
    
    # Stub classes loaded hook - runs before LoadClasses BootLoader
    # right after a slice's classes have been loaded internally.
    def self.loaded
    end
    
    # Initialization hook - runs before AfterAppLoads BootLoader
    def self.init
    end
    
    # Activation hook - runs after AfterAppLoads BootLoader
    def self.activate
    end
    
    # Deactivation hook - triggered by Merb::Slices.deactivate(MerbWatchable)
    def self.deactivate
    end
    
    # Setup routes inside the host application
    #
    # @param scope<Merb::Router::Behaviour>
    #  Routes will be added within this scope (namespace). In fact, any 
    #  router behaviour is a valid namespace, so you can attach
    #  routes at any level of your router setup.
    #
    # @note prefix your named routes with :merb_watchable_
    #   to avoid potential conflicts with global named routes.
    def self.setup_router(scope)
      # no routes for this slice.
    
      # example of a named route
      # scope.match('/index(.:format)').to(:controller => 'main', :action => 'index').name(:index)
      # the slice is mounted at /merb_watchable - note that it comes before default_routes
      # scope.match('/').to(:controller => 'main', :action => 'index').name(:home)
      # enable slice-level default routes by default
      # scope.default_routes
    end
    
  end
  
  # Setup the slice layout for MerbWatchable
  #
  # Use MerbWatchable.push_path and MerbWatchable.push_app_path
  # to set paths to merb_watchable-level and app-level paths. Example:
  #
  # MerbWatchable.push_path(:application, MerbWatchable.root)
  # MerbWatchable.push_app_path(:application, Merb.root / 'slices' / 'merb_watchable')
  # ...
  #
  # Any component path that hasn't been set will default to MerbWatchable.root
  #
  # Or just call setup_default_structure! to setup a basic Merb MVC structure.
  MerbWatchable.push_app_path(:lib, Merb.root / "lib")
  #MerbWatchable.setup_default_structure!
  
  # Add dependencies for other MerbWatchable classes below. Example:
  # dependency "merb_watchable/other"
  
end
