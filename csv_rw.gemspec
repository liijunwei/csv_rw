# frozen_string_literal: true

require_relative "lib/csv_rw/version"

Gem::Specification.new do |spec|
  spec.name = "csv_rw"
  spec.version = CsvRw::VERSION
  spec.authors = ["lijunwei"]
  spec.email = ["ljw532344863@sina.com"]

  spec.summary = "Simple csv reader/writer wrapper"
  spec.description = "Personally frequently used csv file reader and writer"
  spec.homepage = "https://github.com/liijunwei/csv_rw"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/liijunwei/csv_rw"
  spec.metadata["changelog_uri"] = "https://github.com/liijunwei/csv_rw"
  spec.metadata["rubygems_mfa_required"] = "true"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end

  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
