# frozen_string_literal: true

require 'net/http'
require 'csv'
require 'tempfile'

class UbsFile
  attr_reader :path

  def initialize(path:)
    @path = path
  end

  def self.download
    body = Net::HTTP.get(URI(ENV['CSV_URL']))

    tmp = Tempfile.new('ubs_input', encoding: 'ASCII-8BIT')
    tmp.write(body)
    tmp.close

    new(path: tmp.path)
  end

  def transform!
    CSV.parse(
      File.read(path),
      {
        headers: true,
        header_converters: :symbol,
        converters: %i[numeric]
      }
    )
  end
end
