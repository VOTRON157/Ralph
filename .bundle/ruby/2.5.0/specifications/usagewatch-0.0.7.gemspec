# -*- encoding: utf-8 -*-
# stub: usagewatch 0.0.7 ruby lib

Gem::Specification.new do |s|
  s.name = "usagewatch".freeze
  s.version = "0.0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Phil Chen, Ruben Espinosa".freeze]
  s.date = "2013-07-25"
  s.description = "A Ruby Gem with methods to find usage statistics on a Linux server such as CPU, Disk, TCP/UDP Connections, Load, Bandwidth, Disk I/O, and Memory".freeze
  s.email = ["nethacker@gmail.com".freeze]
  s.homepage = "https://github.com/nethacker/usagewatch".freeze
  s.licenses = ["MIT".freeze]
  s.post_install_message = "* Linux version are covered for our test.\nThanks for installing!".freeze
  s.rdoc_options = ["--main".freeze, "README".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "Statistics on a Linux server".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
