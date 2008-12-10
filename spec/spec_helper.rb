require 'rubygems'
require 'merb-core'
require 'merb-slices'
require 'spec'

# Add merb_watchable.rb to the search path
Merb::Plugins.config[:merb_slices][:auto_register] = true
Merb::Plugins.config[:merb_slices][:search_path]   = File.join(File.dirname(__FILE__), '..', 'lib', 'merb_watchable.rb')

# Require merb_watchable.rb explicitly so any dependencies are loaded
require Merb::Plugins.config[:merb_slices][:search_path]

# Define classes to be used in testing.
Merb::BootLoader.before_app_loads do
  class User
    include DataMapper::Resource
    property :id, Serial
    
    def email
      'liam@carpeliam.com'
    end
  end

  class WatchedModel
    include DataMapper::Resource
    property :id, Serial
    property :title, String
    is :watchable, :label => :title
  end
end

# Start 'er up
Merb.start_environment(
  :testing => true, 
  :adapter => 'runner', 
  :environment => ENV['MERB_ENV'] || 'test',
  :session_store => 'memory'
)
