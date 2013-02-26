class DeepStruct::Hash < Hash

  def initialize(hash)
    hash.each do |k, v|
      self[k.to_sym] = DeepStruct.convert_element_if_possible(v)
    end
  end

  def method_missing(key, *args, &block)
    self[key]
  end

  def responds_to?(method)
    self[method]
  end
end

