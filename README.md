# Deep Struct

A library to access nested hashes and arrays in an object oriented way.

## Examples

``` ruby
data = [
  { one: 1, two: 2 },
  { "array": [ "string", "another"] },
  { "nested": [ { "name" => "Sue" } ] },
]

deep_struct = DeepStruct.from_data(data)

deep_struct[0].one               # => 1
deep_struct[0].two               # => 2
deep_struct[1].array             # => ["string", "another"]
deep_struct[2].nested.first.name # => "Sue"
```

Note that DeepStruct does its best to return nested DeepStruct objects, even when accessed through contained arrays.  It accomplishes this by returning `DeepStruct::Array` or `DeepStruct::Hash` objects.

### Reading from files

DeepStruct can also load data files from the filesystem:

``` ruby
DeepStruct.from_file("./data.json")
DeepStruct.from_file("./data.yaml")
```

## Installing

```
# Gemfile
gem "deep_struct"
```

## Bugs and Issues

Please submit them [via github issues](http://github.com/thunderboltlabs/deep_struct/issues).

## Suggestions

If you have any suggestions on how to improve DeepStruct please suggest them through the issues system.

## Development

In order to work on DeepStruct you first need to fork and clone the repo.
Please do any work on a dedicated branch and rebase against master
before sending a pull request.

*No submissions will be accepted without specs.*

## Copyright

Copyright (c) 2009-2012 Thunderbolt Labs. See LICENSE for details.
