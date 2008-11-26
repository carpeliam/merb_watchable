module MerbWatchable
  module DataMapper
    module Is
      module Watchable

        def is_watchable(options = {})
          options = { :label => :name }.merge(options)

          after :save do
            Watch.all(:watchable_type => self.class.name, :watchable_id => self.id).each do |w|
              email = w.watcher.email
              
              Merb.run_later do
                m = Merb::Mailer.new :to => email,
                  :from => Merb::Slices::config[:merb_watchable][:sender],
                  :subject => 'Watch!',
                  :text => "The #{self.class.name} '#{w.watchable.send(options[:label])}' was updated. You should check it out!"
                m.deliver!
              end
              
            end
          end
        end

      end
    end
  end
end
