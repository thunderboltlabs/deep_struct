class DeepStruct::Array < Array
  def initialize arr
    super(arr.map { |elem|
      DeepStruct.convert_element_if_possible(elem)
    })
  end
end
