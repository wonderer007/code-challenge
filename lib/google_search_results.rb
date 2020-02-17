require_relative 'http_middleware.rb'
require 'nokogiri'

class GoogleSearchResults
  def initialize(query:)
    @html = HttpMiddleware::new(query: query).read
  end

  def result
    @page = Nokogiri::HTML(@html)
    @page.css('div.klbar a').map do |item|
      {
        name: item.css('.kltat').text(),
        extension: item.css('.ellip').text(),
        link: absolute_url(item['href']),
        thumbnail: extract_thumbnail(item)  
      }
    end
  end

  private
    def extract_thumbnail(object)
      object.css('g-img img').first['data-key'] || object.css('g-img img').first['data-src']
    end

    def absolute_url(url)
      "https://www.google.com#{url}"
    end  
end
