# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{cap-ext-webistrano}
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mathias Meyer", "Jon Moses"]
  s.date = %q{2010-10-29}
  s.email = %q{jon@burningbush.us}
  s.files = ["Rakefile", "README.markdown", "VERSION.yml", "lib/cap_ext_webistrano", "lib/cap_ext_webistrano/deployment.rb", "lib/cap_ext_webistrano/project.rb", "lib/cap_ext_webistrano/stage.rb", "lib/cap_ext_webistrano/task.rb", "lib/cap_ext_webistrano.rb", "test/cap_ext_webistrano_shoulda.rb", "test/capistrano_stub.rb", "test/project_shoulda.rb", "test/task_shoulda.rb", "test/test_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/jmoses/cap-ext-webistrano}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A drop-in replacement for Capistrano to fire off Webistrano deployments transparently without losing the joy of using the cap command. You need a fully configured Webistrano installation.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capistrano>, [">= 0"])
      s.add_runtime_dependency(%q<activeresource>, [">= 0"])
    else
      s.add_dependency(%q<capistrano>, [">= 0"])
      s.add_dependency(%q<activeresource>, [">= 0"])
    end
  else
    s.add_dependency(%q<capistrano>, [">= 0"])
    s.add_dependency(%q<activeresource>, [">= 0"])
  end
end
