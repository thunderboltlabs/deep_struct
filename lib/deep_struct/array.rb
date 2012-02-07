class DeepStruct::Array < Array
  def [](index)
    DeepStruct.convert_element_if_possible(super)
  end

  # The annoyance of subclassing Array is that ruby implements many array
  # methods directly in C, bypassing my pretty little [] method above.  I
  # expect to implement many methods like #first in the future
  
  def first
    self[0]
  end

  def each(&block)
    super do |e|
      block.call(DeepStruct.convert_element_if_possible(e))
    end
  end
end
