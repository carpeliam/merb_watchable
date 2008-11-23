class WatchedModel
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  is :watchable, :label => :title
end

describe "Watchable" do
  it "should have specs" do
    model = WatchedModel.new
  end
end
