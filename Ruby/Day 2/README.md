# Ruby day 2 Self-study

## How to access files with and without code blocks. What's the benefit of the code block?

Decent explanations about File IO in ruby from tutorial point: http://www.tutorialspoint.com/ruby/ruby_input_output.htm.

It seems that using File.open without code blocks won't close the file handle, where as using it with code block closes it after it is run.

## How to translate a hash to an array? How about the otherway?

* `{"one" => 1, "two" => 2}.collect { |i| i[1] }`, but you loose the key. Or .to_a method, where you get `[[key, value], ...]`
* Translating to hashes can be done with .to_h, but requires structure from the array. http://stackoverflow.com/questions/39567/what-is-the-best-way-to-convert-an-array-to-a-hash-in-ruby

## Can you iterate through hash?

Yup - with .each and so on. It includes the enumerable mixin. It operates on `[key, value]` pairs. 

## What other common data structures do arrays support, than stacks?

* Queue
* Linked list
* Stack
* Set