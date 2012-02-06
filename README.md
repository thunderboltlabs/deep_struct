# Deep Struct

A library to access nested hashes and arrays in an object oriented way.

## Examples

``` ruby
data = [
  { one: 1, two: 2 },
  { "array": [ "string", "another"] },
  { "nested": [ { "name" => "Sue" } ] },
]

deep_struct = DeepStruct.from(data)

deep_struct.first.one             # => 1
deep_struct.first.two             # => 2
deep_struct[1].array              # => ["string", "another"]
deep_struct[2].nested.first.name  # => "Sue"
```

Note that DeepStruct does its best to return nested DeepStruct objects, even when accessed through contained arrays.  It accomplishes this by returning DeepStruct::Array or DeepStruct::Hash objects.

To gain access to the original ruby structures, call `to_ary`, `to_hash`, or `to_ruby_structure`.

