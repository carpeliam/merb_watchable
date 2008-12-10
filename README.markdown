merb_watchable
==============

MerbWatchable sends you emails when your stuff is modified. It's built for merb
1.0.3+, and currently assuming DataMapper.

merb_watchable is a pretty simple slice for alerting users when model objects
they're "watching" are saved. Right now, it assumes that you have a User class
called `User` (sorry about that, hope to fix soon for those of you `Person`
class authors) with a field called `email` (once again, apologies).

config
------

Unfortunately not much config at the moment, this is pretty bare. You can
specify the "from:" in the email with the following:

    Merb::Slices::config[:merb_watchable][:sender] = 'your_email@here.com'

Add that to your `Merb::BootLoader.before_app_loads` and you should be in good
shape. Obviously, make sure you've required merb-mailers and that your Merb
Mailer config is in good working order.

Here's an example of a model:

    class WatchedModel
      include DataMapper::Resource
      property :id, Serial
      property :title, String
      
      is :watchable, :label => :title
    end

Note the `is :watchable` part there. Stick that in your model, and your model
will be, well, watchable. The :label option allows you to specify how the model
will be referred to. If you don't specify anything, watchable will assume that
you have a field in your model called "title", and will show that field in the
email.

using merb_watchable
--------------------

The slice will automatically add a `watches` table to keep track of what objects
are currently being watched. To those of you writing merb apps dedicated to
wrist watches, again, I apologize. Here's what you need to do in order to
specify that the current user is watching an object:

    Watch.create(:watcher => session.current_user, :watchable => your_object)

Voila, you're done. (Or as I once overheard, "Viola! You're done!") Check the
[TODO](TODO) page for what needs to be done (which is a lot, at the moment).
