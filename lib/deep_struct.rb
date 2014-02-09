require 'json'
require 'yaml'

module DeepStruct
  def self.from_data(data)
    case data
    when ::Array then DeepStruct::Array.new(data)
    when ::Hash  then DeepStruct::Hash.new(data)
    else
      raise "Unrecognized data: #{data.inspect}"
    end
  end

  def self.convert_element_if_possible(e)
    case e
    when ::Array then DeepStruct::Array.new(e)
    when ::Hash  then DeepStruct::Hash.new(e)
    else
      e
    end
  end

  def self.from_file(path)
    from_data(FileReader.new(path).data)
  end
end

require "deep_struct/array"
require "deep_struct/hash"
require "deep_struct/file_reader"
