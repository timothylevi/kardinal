require 'rake'
require 'rspec/core/rake_task'
require File.expand_path('../config/application', __FILE__)

Cardinal::Application.load_tasks
RSpec::Core::RakeTask.new(:spec)

task :default  => :spec