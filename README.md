# MyAncestry

Make search of objects parents/childrem/brothers .....


## Installation

Add this line to your application's Gemfile:

    gem 'my_ancestry'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install my_ancestry

## Usage

  list = [
          {
            id:1,
            name: "couto",
            ancestry:nil
          },
          {
            id:2,
            name: "teste",
            ancestry:"000001"
          },
          {
            id:3,
            name: "teste2",
            ancestry:"0001"
          }
        ]

  result = MyAncestry.new(list,{:id=> :id, :ancestry_id => :ancestry})

  brothers = result.brothers_of(2)
  childrem = result.childrem_of(1)
  parent = result.parent_of(3)
  .....


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
6. Execure the "THE BEER-WARE LICENSE".