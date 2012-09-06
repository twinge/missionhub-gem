#!/usr/bin/env rake
require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new do |t|
  t.test_files = FileList['spec/lib/missionhub/*_spec.rb'] + FileList['spec/lib/*_spec.rb']
  t.verbose = true
end

task :default => :test
