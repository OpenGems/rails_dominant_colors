# frozen_string_literal: true

require 'net/http'

module RailsDominantColors
  class Url < Base
    def initialize(source, colors)
      raise(EmptySource) if source.nil? || source.empty?

      super(process(source), colors)
    end

    def process(source)
      raise(InvalidUrl) unless valid_url?(source)

      ri = remote_image(source)
      content_type = ri.content_type.to_sym
      extension = extensions[content_type]

      raise(NotAnImage) if extension.nil?

      tempfile(extension, ri.body)
    end

    private

    def remote_image(url)
      uri = uri(url)
      req = Net::HTTP::Get.new(uri.to_s)
      ssl = uri.scheme == 'https'
      Net::HTTP.start(uri.host, uri.port, use_ssl: ssl) do |http|
        http.request(req)
      end
    rescue StandardError
      raise(UrlNotFound)
    end

    def valid_url?(url)
      url =~ URI::DEFAULT_PARSER.make_regexp(%w[http https])
    end

    def uri(url)
      URI.parse(url)
    rescue StandardError
      raise(InvalidUrl)
    end

    def tempfile(extension, body)
      tempfile = Tempfile.open(['source', extension])
      tempfile.write(body)
      tempfile.close
      tempfile.path
    end
  end
end
