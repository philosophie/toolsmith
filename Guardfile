# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'rspec' do
  watch(%r{^lib/toolsmith/helpers/(.+)\.rb$}) {|m| "spec/unit/#{m[1]}_spec.rb"}
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/toolsmith/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end