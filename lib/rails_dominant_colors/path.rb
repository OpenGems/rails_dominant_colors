# frozen_string_literal: true

module RailsDominantColors
  class Path < Base
    def initialize(source, opts = {})
      raise(EmptySource) if source.nil? || source.empty?
      raise(FileNotFound) unless file_exist?(source)
      raise(NotAnImage) unless file_is_image?(source)

      super(source, opts)
    end

    private

    def file_exist?(source)
      File.exist?(source)
    end

    def file_is_image?(source)
      extension = File.extname(source)
      extensions.values.include?(extension)
    end
  end
end
