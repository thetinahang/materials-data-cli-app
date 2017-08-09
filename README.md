# Materials::Data

This gem will involve scraping data from the National Institute of Standards and Technology (NIST) Repositories website (http://nist.matdl.org/dspace/xmlui/community-list). The website itself contains links to different databases. So this gem has a command line interface where the user will be able to search the table with a select number of keywords, given at the prompt, and return a list of links that match the keyword entered. This gem is designed with the intent of making materials informatics resources available to the user. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'materials-data'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install materials-data

## Usage

Once installed and running, run materials-data. 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thetinahang/materials-data-cli-app.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
