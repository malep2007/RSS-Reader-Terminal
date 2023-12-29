# RSS Reader Class

require 'rss'
require 'open-uri'

class RSSReader
    def initialize(url)
      @url = url
    end

    def fetch(url)
        URI.open(url) do |rss|
            @feed = RSS::Parser.parse(rss)
            @title = @feed.channel.title
            @feed.items.each do |item|
                @item = "Item #{item.title} - #{item.pubDate}"
            end
        end
    end
  end
end
