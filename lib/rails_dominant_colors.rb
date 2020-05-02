# frozen_string_literal: true

require 'rails_dominant_colors/base'
require 'rails_dominant_colors/base64'
require 'rails_dominant_colors/path'
require 'rails_dominant_colors/url'

module RailsDominantColors
  class << self
    def base64(source, opts = {})
      RailsDominantColors::Base64.new(source, opts)
    end

    def url(source, opts = {})
      RailsDominantColors::Url.new(source, opts)
    end

    def path(source, opts = {})
      RailsDominantColors::Path.new(source, opts)
    end
  end
end
