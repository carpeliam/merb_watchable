dependency "merb-mailer", "1.0.3"
dependency "dm-core", "0.9.7"
use_orm :datamapper

Merb::Config.use do |c|
  c[:session_secret_key]  = '9bd759dab49da1399ec2cc11da71394730756b00'
  c[:session_store] = 'cookie'
  c[:reload_templates] = true
end

Merb::BootLoader.before_app_loads do
  Merb::Slices::config[:merb_watchable][:user_class] = 'User'
  Merb::Slices::config[:merb_watchable][:sender] = 'bam@bam.com'
  Merb::Mailer.delivery_method = :test_send
end

Merb::BootLoader.after_app_loads do
end
