# Pinkbike::Pod::Downloader

Downloads the latest Pinkbike PODs to a directory.

If you're a fan of Pinkbike's PODs (Photo Of the Day), then you might want to download them use them for your desktop
background, for example.
This gem downloads the most recent PODs to a directory of your choosing. You could even create a cron that periodically
downloads new PODs!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pinkbike-pod-downloader'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pinkbike-pod-downloader

## Usage

```
Usage: pinkbike-pod-downloader [options]
    -o OUTPUT_DIRECTORY,             The directory where downloaded images should be stored
        --output-directory
    -k TWITTER_CONSUMER_KEY,
        --twitter-consumer-key
    -s TWITTER_CONSUMER_SECRET,
        --twitter-consumer-secret
    -t TWITTER_ACCESS_TOKEN,
        --twitter-access-token
    -a TWITTER_ACCESS_SECRET,
        --twitter-access-secret
```

Twitter API keys are required. More info on how to obtain these can be found [here][twitter-api-keys-documentation].

You can provide Twitter API keys on the command line, but you may prefer to set your API keys as environment variables
for use by the gem:

```
export TWITTER_CONSUMER_KEY=""
export TWITTER_CONSUMER_SECRET=""
export TWITTER_ACCESS_TOKEN=""
export TWITTER_ACCESS_SECRET=""
```

Then run!

```
pinkbike-pod-downloader -o /path/to/directory/where/you/want/to/store/the/photos
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/pinkbike-pod-downloader. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[twitter-api-keys-documentation]: https://dev.twitter.com/oauth/overview/application-owner-access-tokens
