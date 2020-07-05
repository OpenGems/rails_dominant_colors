# RailsDominantColors

[![Gem Version](https://badge.fury.io/rb/rails_dominant_colors.svg)](https://badge.fury.io/rb/rails_dominant_colors)
[![Maintainability](https://api.codeclimate.com/v1/badges/83326d81b9112b45768f/maintainability)](https://codeclimate.com/github/OpenGems/rails_dominant_colors/maintainability)
[![Build Status](https://travis-ci.org/OpenGems/rails_dominant_colors.svg?branch=master)](https://travis-ci.org/OpenGems/rails_dominant_colors)
[![security](https://hakiri.io/github/OpenGems/rails_dominant_colors/master.svg)](https://hakiri.io/github/OpenGems/rails_dominant_colors/master)
![Gem](https://img.shields.io/gem/dt/rails_dominant_colors)
[![Coverage Status](https://coveralls.io/repos/github/OpenGems/rails_dominant_colors/badge.svg?branch=master)](https://coveralls.io/github/OpenGems/rails_dominant_colors?branch=master)

A Ruby gem for extract the dominant color(s) from an image (remote image, locally image, base64 image etc...)

Get HEX(A) color(s), RGB(A) color(s) and HSL(A) color(s)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_dominant_colors'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rails_dominant_colors

## Usage

```ruby
colors = 5 # Optional, number of colors (default: 5)

dominant_colors = RailsDominantColors::Base64.new('data:image/png;base64,awesome-image', colors)

# or

RailsDominantColors::Url.new('https://awesome-url.com/awesome-image.png', colors)

# or

RailsDominantColors::Path.new('/awesome/path/awesome-image.png', colors)

# and

dominant_colors.to_hex # => ["#FF007F", "#000000", "#1C000F", "#A0004F", "#000000"]
dominant_colors.to_hex_alpha # => ["#FF007FFF", "#00000000", "#1C000FFE", "#A0004FFF", "#0000005F"]

dominant_colors.to_rgb # => [[255, 0, 127], [0, 0, 0], [28, 0, 15], [160, 0, 79], [0, 0, 0]]
dominant_colors.to_rgb_alpha # => [[255, 0, 127, 1.0], [0, 0, 0, 0.0], [28, 0, 15, 1.0], [160, 0, 79, 1.0], [0, 0, 0, 0.37]]

dominant_colors.to_hsl # => [[330, 100, 50], [0, 0, 0], [328, 100, 5], [330, 100, 31], [0, 0, 0]]
dominant_colors.to_hsl_alpha # => [[330, 100, 50, 1.0], [0, 0, 0, 0.0], [328, 100, 5, 1.0], [330, 100, 31, 1.0], [0, 0, 0, 0.37]]

# Awesome bonus
dominant_colors.to_pct # => [52.16, 37.45, 9.93, 0.35, 0.1]

```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/OpenGems/rails_dominant_colors. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
