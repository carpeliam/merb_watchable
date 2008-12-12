# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{merb_watchable}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Liam Morley"]
  s.date = %q{2008-12-12}
  s.description = %q{MerbWatchable sends you emails when your stuff is modified.}
  s.email = %q{liam@carpeliam.com}
  s.extra_rdoc_files = ["README.markdown", "LICENSE", "TODO"]
  s.files = ["LICENSE", "README.markdown", "Rakefile", "TODO", "lib/dm", "lib/dm/watch.rb", "lib/dm/dm_watchable.rb", "lib/merb_watchable.rb", "lib/merb_watchable", "lib/merb_watchable/slicetasks.rb", "lib/merb_watchable/spectasks.rb", "lib/merb_watchable/merbtasks.rb", "spec/spec_helper.rb", "spec/controllers", "spec/controllers/main_spec.rb", "spec/lib", "spec/lib/watch_spec.rb", "spec/lib/watchable_spec.rb", "spec/merb_watchable_spec.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://www.carpeliam.com}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{merb}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{MerbWatchable sends you emails when your stuff is modified.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<merb-slices>, [">= 1.0.3"])
      s.add_runtime_dependency(%q<merb-mailer>, [">= 1.0.3"])
    else
      s.add_dependency(%q<merb-slices>, [">= 1.0.3"])
      s.add_dependency(%q<merb-mailer>, [">= 1.0.3"])
    end
  else
    s.add_dependency(%q<merb-slices>, [">= 1.0.3"])
    s.add_dependency(%q<merb-mailer>, [">= 1.0.3"])
  end
end
