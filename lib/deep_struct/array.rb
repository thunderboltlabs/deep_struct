class DeepStruct::Array < Array
  def [](index)
    v = super
    return DeepStruct::Hash.new(v)  if v.is_a?(::Hash)
    return DeepStruct::Array.new(v) if v.is_a?(::Array)
    return v
  end

  # The annoyance of subclassing Array is that ruby implements many array
  # methods directly in C, bypassing my pretty little [] method above.  I
  # expect to implement many methods like #first in the future
  
  def first
    self[0]
  end
end
