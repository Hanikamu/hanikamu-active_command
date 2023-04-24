# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

Gem::Specification.new do |s|
  s.name = "hanikamu-active_command"
  s.version = "0.1.0"
  s.authors = ["Nicolai Seerup", "Alejandro Jimenez"]
  s.summary = "Active model style service errors"
  s.required_ruby_version = ">= 3"

  s.homepage      = "https://github.com/Hanikamu/hanikamu-service"
  s.license       = "MIT"

  s.files = Dir["{config,lib}/**/*", "Rakefile"]
  s.require_paths = ["lib"]

  s.add_dependency  "hanikamu-service", "~> 0.1.0"
  #s.add_dependency  "zeitwerk", "< 3"
  s.add_dependency  "activemodel", "< 8"

  s.metadata["rubygems_mfa_required"] = "true"
end
