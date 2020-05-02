# frozen_string_literal: true

require_relative 'lib/rails_dominant_colors/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails_dominant_colors'
  spec.version       = RailsDominantColors::VERSION
  spec.authors       = ['Boris BRESCIANI']
  spec.email         = ['boris2bresciani@gmail.com']

  spec.summary       = 'Extract the dominant color(s) from an image'
  spec.description   = <<~TEXT
    Extract the dominant color(s) from an image (remote image, locally image, base64 image etc...)
    Convert to HEX(A), RGB(A), HSL(a)'
  TEXT

  spec.homepage      = 'https://github.com/OpenGems/rails_dominant_colors'
  spec.license       = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0")
                     .reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'coveralls', '~> 0.8'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'simplecov', '~> 0.16'

  spec.add_dependency 'mini_magick', '~> 4.10'
end
