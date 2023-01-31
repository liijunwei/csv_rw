# frozen_string_literal: true

require "csv"
require_relative "csv_rw/version"

# simple csv wrapper
module CsvRw
  def self.read(csv_filepath)
    result = []
    CSV.foreach(csv_filepath, headers: true, converters: :all) do |row|
      result << row.to_h.transform_keys(&:to_sym)
    rescue => e
      $stderr.puts({error_class: e.class, error_message: e.message, row: row.to_h}.to_json)
      raise e
    end

    result.reject { |e| e.compact.empty? }
  end

  def self.write(output, csv_filepath)
    headers = output.first.keys

    CSV.open(csv_filepath, "w") do |csv|
      csv << headers

      output.each { |hash| csv << hash.values }
    end
  end
end
