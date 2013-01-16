require 'bundler'
require 'rake/testtask'
require 'bundler/gem_tasks'

GEMFILES = Dir["gemfiles/*.gemfile"].inject({}) do |memo, gemfile|
  if gemfile.include?('common')
    memo
  else
    version = gemfile.match(/rails(\d\.\d)/)[1]
    memo[version] = gemfile
    memo
  end
end

DEFAULT_GEMFILE = GEMFILES['3.2']

desc 'Setup default Gemfile'
task 'setup' do 
  default_gemfile
end

namespace :test do

  Rake::TestTask.new(:default) do |t|
    t.libs = ['lib','test']
    t.test_files = Dir.glob("test/**/*_test.rb").sort
    t.verbose = true
  end

  GEMFILES.each do |version, gemfile|

    desc "Test using Rails v#{version}"
    task "rails#{version}" => 'setup' do
      with_rails_version(version) { Rake::Task['test:default'].execute }
    end

  end

end

task :test => 'test:default'
task :default => 'test:default'

def with_rails_version(version)
  begin
    FileUtils.rm_rf 'Gemfile'
    FileUtils.rm_rf 'Gemfile.lock'
    FileUtils.ln_s GEMFILES[version], 'Gemfile', :force => true
    `bundle install`
    yield
  ensure
    default_gemfile
  end
end

def default_gemfile
  FileUtils.ln_s DEFAULT_GEMFILE, 'Gemfile', :force => true
  FileUtils.rm_rf 'Gemfile.lock'
end
