# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pinkbike/pod/downloader/version'

Gem::Specification.new do |spec|
  spec.name          = 'pinkbike-pod-downloader'
  spec.version       = Pinkbike::Pod::Downloader::VERSION
  spec.authors       = ['Joe Nyland']
  spec.email         = ['joenyland@me.com']

  spec.summary       = 'Downloads the latest Pinkbike PODs to a directory'
  spec.description   = <<-EOF
If you're a fan of Pinkbike's PODs (Photo Of the Day), then you might want to download them use them for your desktop
background, for example.
This gem downloads the most recent PODs to a directory of your choosing. You could even create a cron that periodically
downloads new PODs!
EOF
  spec.homepage      = 'https://github.com/JoeNyland/pinkbike-pod-downloader'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.40'
  spec.add_development_dependency 'reek', '~> 4.0'

  spec.add_dependency 'twitter', '~> 5.16'
end
