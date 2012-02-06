# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'rspec', :version => 2, :cli => "--backtrace" do
  watch(%r{^spec/.+_spec\.rb$})
  watch('spec/spec_helper.rb')  { "spec" }

  watch(%r{^.rspec$})           { "spec" }
  watch(%r{^config/.*$})        { "spec" }
  watch(%r{^lib/(.+)\.rb$})     { "spec" }
end

guard 'bundler' do
  watch('Gemfile')
  watch(/^.+\\.gemspec/)
end
