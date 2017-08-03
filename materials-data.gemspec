# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "materials/version"

Gem::Specification.new do |spec|
  spec.name          = "materials-data"
  spec.version       = MaterialsData::VERSION
  spec.authors       = ["thetinahang"]
  spec.email         = ["thetinahang@gmail.com"]

  spec.summary       = %q{This gem will involve scraping data from the National Institute of Standards and Technology (NIST) Data
Gateway website.}
  spec.description   = %q{This gem will involve scraping data from the National Institute of Standards and Technology (NIST) Data
Gateway website. In particular, the user will be able to search the NIST Online Databases 
list based on keyword selection. This would help the user, who may be interested in 
materials informatics, narrow down the number of available databases according to their 
preference or emphasis in studies.}
  spec.homepage      = "https://github.com/thetinahang/materials-data-cli-app"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "nokogiri"
end
