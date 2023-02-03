# frozen_string_literal: true

require "spec_helper"
require "fileutils"

RSpec.describe CsvRw do
  it "has a version number" do
    expect(CsvRw::VERSION).not_to be nil
  end

  describe ".read" do
    let(:filename) { "spec/fixtures/users.csv" }

    it "reads from csv file" do
      records = described_class.read(filename)

      expect(records.count).to eq(3)
      expect(records[0]).to eq({ id: 1, name: "Frodo-the-ring-bearer" })
      expect(records[1]).to eq({ id: 2, name: "Samwise-the-brave" })
      expect(records[2]).to eq({ id: 3, name: "Gandalf-the-grey" })
    end
  end

  describe ".write" do
    let(:filename) { "spec/fixtures/colors.csv" }

    after { FileUtils.rm(filename) }

    it "writes to csv file" do
      output = []
      output << { id: 1, color: "yellow" }
      output << { id: 2, color: "green" }
      output << { id: 3, color: "blue" }
      described_class.write(output, filename)

      expect(described_class.read(filename).count).to eq(3)
    end
  end
end
