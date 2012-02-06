module DeepStruct
  def self.from_data(data)
    case data
    when ::Array then DeepStruct::Array.new(data)
    when ::Hash  then DeepStruct::Hash.new(data)
    else
      raise "Unrecognized data: #{data.inspect}"
    end
  end
end

require "deep_struct/array"
require "deep_struct/hash"
