require 'pinkbike/pod/downloader/version'
require 'twitter'
require 'open-uri'

module Pinkbike
  module Pod
    # Downloads Pinkbike PODs
    module Downloader
      PINKBIKE_IMAGE_BASE_URL = 'http://ep1.pinkbike.org'.freeze

      def self.run(opts = {})
        # Connect to the Twitter API
        connect!(opts)

        # Get all tweets that are from @pinkbike (excluding replies)
        @client.user_timeline('pinkbike', exclude_replies: true).each do |tweet|
          # Loop through each tweet and get the POD image

          # Skip if we've not got the right hashtags
          next unless (tweet.hashtags.map { |hashtag| hashtag.text.downcase } & %w( pinkbikepod pod )).any?

          # Skip if there's no URLs in the tweet
          next unless tweet.urls?

          # Loop through each link
          tweet.urls.each do |url|
            uri = url.expanded_url
            # Skip the tweet if it doesn't contain a link to the POD
            next unless uri =~ %r{pinkbike.com\/photo\/\w.+/}

            # Get the ID of the POD image in the link
            pic_id = uri.to_s[%r{photo\/\d+}][/\d+/]
            pic_url = "#{PINKBIKE_IMAGE_BASE_URL}/p0pb#{pic_id}/p5pb#{pic_id}.jpg"
            filename = "#{opts[:output_dir]}/#{pic_url[/\w+\.jpg$/]}"

            # Dump the image to a file in opts[:output_dir]
            break if File.file? filename # Skip images that have already been downloaded
            File.open(filename, 'wb') do |output_file|
              open(pic_url, 'rb') do |picture_file|
                output_file.write(picture_file.read)
                puts "Downloaded #{filename}"
              end
            end

            # We've downloaded the POD in this tweet, so no need to iterate on the rest of the links in the tweet
            break
          end
        end
      end

      # Connect to the Twitter API using API keys in the environment variables
      def self.connect!(opts = {})
        @client = ::Twitter::REST::Client.new do |config|
          config.consumer_key        = opts[:twitter_consumer_key]    || ENV.fetch('TWITTER_CONSUMER_KEY')
          config.consumer_secret     = opts[:twitter_consumer_secret] || ENV.fetch('TWITTER_CONSUMER_SECRET')
          config.access_token        = opts[:twitter_access_token]    || ENV.fetch('TWITTER_ACCESS_TOKEN')
          config.access_token_secret = opts[:twitter_access_secret]   || ENV.fetch('TWITTER_ACCESS_SECRET')
        end
      end
    end
  end
end
