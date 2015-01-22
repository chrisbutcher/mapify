# mapify
Map arrays (or hashes, with ```Enumerable.hashify```) of attributes out of enumerables of objects, passing symbols as arguments.

## Installation
```ruby
gem 'mapify', '~> 0.0.4'
```

## Examples
```ruby
object_1 = OpenStruct.new(name: 'Alice', occupation: 'Baker')
object_2 = OpenStruct.new(name: 'Bob', occupation: 'Farmer')
array = [object_1, object_2]

array.mapify(:name, :occupation)
# => [['Alice', 'Baker'], ['Bob', 'Farmer']]

array.hashify(:name, :occupation)
# => [{name: 'Alice', occupation: 'Baker'}, {name: 'Bob', occupation: 'Farmer'}]
```

https://rubygems.org/gems/mapify
