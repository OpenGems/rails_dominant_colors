# frozen_string_literal: true

require 'base64'

module RailsDominantColors
  class Base64 < Base
    def initialize(source, colors)
      raise(EmptySource) if source.nil? || source.empty?

      super(process(source), colors)
    end

    private

    def process(source)
      res = source.match(%r{data:(?<type>[-\w]+/[-\w+.]+)?;base64,(?<content>.*)})
      raise(InvalidBase64) if res.nil?

      content_type = res[:type].to_sym
      extension = extensions[content_type]
      raise(NotAnImage) if extension.nil?

      tempfile(extension, ::Base64.decode64(res[:content]))
    end

    def tempfile(extension, body)
      tempfile = Tempfile.open(['source', ".#{extension}"])
      tempfile.write(body)
      tempfile.close
      tempfile.path
    end
  end
end
