describe "Watchable" do
  before(:each) do
    Watch.all.destroy!
    @mailer = mock("mailer")
    Merb::Mailer.stub!(:new).and_return(@mailer)
  end
  
  it "should send email when updated" do
    model = WatchedModel.create(:title => 'foo')
    watch = Watch.new
    watch.watchable = model
    watch.watcher = User.create
    watch.save
    model.title = 'bar'
    Merb::Mailer.should_receive(:new).and_return(@mailer)
    @mailer.should_receive(:deliver!)
    model.save
  end
end
