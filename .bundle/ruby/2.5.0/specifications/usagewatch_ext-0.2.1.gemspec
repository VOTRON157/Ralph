# -*- encoding: utf-8 -*-
# stub: usagewatch_ext 0.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "usagewatch_ext".freeze
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ruben Espinosa, Phil Chen".freeze]
  s.date = "2015-04-25"
  s.description = "A Ruby Gem with methods to find usage statistics such as CPU, Disk, TCP/UDP Connections, Load, Bandwidth, Disk I/O, and Memory".freeze
  s.email = ["rderoldan1@gmail.com".freeze]
  s.homepage = "https://github.com/rderoldan1/usagewatch_ext".freeze
  s.licenses = ["MIT".freeze]
  s.post_install_message = "* Usagewatch Gem for linux are covered for our test.\n* Mac OS version is in development\nThanks for installing!".freeze
  s.rdoc_options = ["--main".freeze, "README".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "Extended version of usagewatch".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<usagewatch>.freeze, ["~> 0.0.6"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
    else
      s.add_dependency(%q<usagewatch>.freeze, ["~> 0.0.6"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<usagewatch>.freeze, ["~> 0.0.6"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
  end
end
