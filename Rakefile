# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new

# ref: rubocop-ast Rakefile
desc "Run RSpec with code coverage"
task :coverage do
  ENV["COVERAGE"] = "true"
  Rake::Task["spec"].execute
  begin
    sh "open coverage/index.html"
  rescue StandardError
    nil
  end
end

task default: %i[spec rubocop]
