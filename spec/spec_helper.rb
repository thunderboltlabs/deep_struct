require 'bundler/setup'

require 'rspec'
require 'deep_struct'

class ::Array
  def second; self[1]; end
end

def fixture_file_path(filename)
  File.join(File.dirname(__FILE__), "fixtures", filename)
end
