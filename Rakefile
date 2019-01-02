require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'pry'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
task :console do
  require_relative 'lib/mbtransfer.rb'
  Pry.start
end


