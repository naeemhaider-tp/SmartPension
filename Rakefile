# frozen_string_literal: true

require 'rubocop/rake_task'

task default: %w[lint test]

RuboCop::RakeTask.new(:lint) do |task|
  task.fail_on_error = false
end

task :run do
  ruby 'smart_pension.rb webserver.log'
end

task :test do
  ruby 'spec/parser_spec.rb'
end
