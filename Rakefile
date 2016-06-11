require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'reek/rake/task'

RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new
Reek::Rake::Task.new do |t|
  t.fail_on_error = false
end

task default: :spec
