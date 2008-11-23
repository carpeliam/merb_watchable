require File.dirname(__FILE__) + '/../spec_helper'

describe "MerbWatchable::Main (controller)" do
  
  # Feel free to remove the specs below
  
  before :all do
    Merb::Router.prepare { add_slice(:MerbWatchable) } if standalone?
  end
  
  after :all do
    Merb::Router.reset! if standalone?
  end
  
  it "should have access to the slice module" do
    controller = dispatch_to(MerbWatchable::Main, :index)
    controller.slice.should == MerbWatchable
    controller.slice.should == MerbWatchable::Main.slice
  end
  
  it "should have an index action" do
    controller = dispatch_to(MerbWatchable::Main, :index)
    controller.status.should == 200
    controller.body.should contain('MerbWatchable')
  end
  
  it "should work with the default route" do
    controller = get("/merb_watchable/main/index")
    controller.should be_kind_of(MerbWatchable::Main)
    controller.action_name.should == 'index'
  end
  
  it "should work with the example named route" do
    controller = get("/merb_watchable/index.html")
    controller.should be_kind_of(MerbWatchable::Main)
    controller.action_name.should == 'index'
  end
    
  it "should have a slice_url helper method for slice-specific routes" do
    controller = dispatch_to(MerbWatchable::Main, 'index')
    
    url = controller.url(:merb_watchable_default, :controller => 'main', :action => 'show', :format => 'html')
    url.should == "/merb_watchable/main/show.html"
    controller.slice_url(:controller => 'main', :action => 'show', :format => 'html').should == url
    
    url = controller.url(:merb_watchable_index, :format => 'html')
    url.should == "/merb_watchable/index.html"
    controller.slice_url(:index, :format => 'html').should == url
    
    url = controller.url(:merb_watchable_home)
    url.should == "/merb_watchable/"
    controller.slice_url(:home).should == url
  end
  
  it "should have helper methods for dealing with public paths" do
    controller = dispatch_to(MerbWatchable::Main, :index)
    controller.public_path_for(:image).should == "/slices/merb_watchable/images"
    controller.public_path_for(:javascript).should == "/slices/merb_watchable/javascripts"
    controller.public_path_for(:stylesheet).should == "/slices/merb_watchable/stylesheets"
    
    controller.image_path.should == "/slices/merb_watchable/images"
    controller.javascript_path.should == "/slices/merb_watchable/javascripts"
    controller.stylesheet_path.should == "/slices/merb_watchable/stylesheets"
  end
  
  it "should have a slice-specific _template_root" do
    MerbWatchable::Main._template_root.should == MerbWatchable.dir_for(:view)
    MerbWatchable::Main._template_root.should == MerbWatchable::Application._template_root
  end

end