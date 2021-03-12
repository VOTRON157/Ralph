# -*- encoding: utf-8 -*-
# stub: png_canvas 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "png_canvas".freeze
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Daniel Cruz Horts".freeze]
  s.date = "2016-06-09"
  s.homepage = "https://github.com/dncrht/png_canvas".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "A minimalist library to render PNG images using pure Ruby".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>.freeze, [">= 3"])
      s.add_development_dependency(%q<pry-byebug>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rspec>.freeze, [">= 3"])
      s.add_dependency(%q<pry-byebug>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>.freeze, [">= 3"])
    s.add_dependency(%q<pry-byebug>.freeze, [">= 0"])
  end
end
