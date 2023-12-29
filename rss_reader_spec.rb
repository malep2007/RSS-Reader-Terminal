require_relative 'reader'
require 'rspec'

describe RSSReader do
    let(:url) { "https://www.nasa.gov/rss/dyn/breaking_news.rss" }  
    let(:reader) { RSSReader.new(url) }

    describe '#fetch' do
        it 'fetches the RSS feed' do
            reader.fetch
            expect(reader.feed).to be_a(RSS::Rss)
        end
    end
end
