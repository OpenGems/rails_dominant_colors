# frozen_string_literal: true

require 'rails_dominant_colors/base'
require 'rails_dominant_colors/base64'
require 'rails_dominant_colors/path'
require 'rails_dominant_colors/url'

module RailsDominantColors
  class << self
    def base64(source, colors = 5)
      RailsDominantColors::Base64.new(source, colors)
    end

    def url(source, colors = 5)
      RailsDominantColors::Url.new(source, colors)
    end

    def path(source, colors = 5)
      RailsDominantColors::Path.new(source, colors)
    end
  end
end
