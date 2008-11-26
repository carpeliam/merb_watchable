class Watch
  include DataMapper::Resource
  property :id, Serial
  property :watchable_id, Integer, :nullable => false
  property :watchable_type, String, :nullable => false
  belongs_to :watcher, :class_name => 'User'
  
  def watchable
    eval("#{watchable_type}.get!(#{watchable_id})")
  end
  
  def watchable=(w)
    attribute_set(:watchable_type, w.class.name)
    attribute_set(:watchable_id, w.id)
  end
end
