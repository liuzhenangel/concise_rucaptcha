require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'rake/extensiontask'

Rake::ExtensionTask.new "concise_rucaptcha" do |ext|
  ext.lib_dir = "lib/concise_rucaptcha"
end

RSpec::Core::RakeTask.new(:spec)
task default: :spec


task :preview do
  require 'concise_rucaptcha'

  res = ConciseRuCaptcha.create(1)
  puts res[1]
end
