

describe Watch do
  before(:each) do
    @watch = Watch.new
  end
  
  it "should be a model which includes DataMapper::Resource" do
    Watch.should be
    Watch.should include(DataMapper::Resource)
  end
  
  it "should have properties: id, watchable_id, watchable_type, and user_id" do
    @watch.attributes.should have_key(:id)
    @watch.attributes.should have_key(:watchable_id)
    @watch.attributes.should have_key(:watchable_type)
    @watch.attributes.should have_key(:user_id)
  end
  
  it "should set watchable_type and _id when watchable is set" do
    wm = WatchedModel.create(:title => 'whatever')
    @watch.watchable = wm
    @watch.watchable_type.should == 'WatchedModel'
    @watch.watchable_id.should == wm.id
  end
end
