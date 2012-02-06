require 'bundler/setup'

require 'rspec'
require 'deep_struct'

class ::Array
  def second; self[1]; end
end

