module DataMapper
  module Is
    module Watchable

      def is_watchable(options)
        @label = (options[:label] or :name)
        
        #TODO move this into after(:save)
        m = Merb::Mailer.new :to => 'liam@carpeliam.com',
                             :from => Merb::Slices::config[:merb_watchable][:sender],
                             :subject => 'Watch!',
                             :text => 'It was updated'
        m.deliver!
      end

    end
  end
end
