# RSS Reader Class

require 'rss'
require 'open-uri'

class RSSReader
    attr_reader :url, :feed, :title, :description, :link

    def initialize(url)
      @url = url
    end

    def fetch
        URI.open(@url) do |rss|
            @feed = RSS::Parser.parse(rss)
            @title = @feed.channel.title
            @description = @feed.channel.description
        end
    end

    def self.run
        puts "Enter a URL to an RSS feed: "
        url = gets.chomp
        reader = RSSReader.new(url)
        reader.fetch
        puts reader.title
        reader.feed.items.each do |item|
            puts "---------------------------------"
            puts "Title: #{item.title}"
            puts "Description: #{item.description}"
            puts "Link: #{item.link}"
            puts "---------------------------------"
        end
    end
end




if __FILE__ == $0
    RSSReader.run
end