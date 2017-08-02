require "materials/data/version"
require "nokogiri"

class Materials::Database

    attr_accessor :database, :title, :link, :desc, :keyword

#    def initialize(keyword)
#    	@keyword = keyword
#    end


    def self.scrape_nist # only one website to be scraped
        databases = []

        doc = Nokogiri::HTML(open("https://srdata.nist.gov/gateway/gateway?dblist=1"))
        database = self.new
        database.link = doc.search()
        database.desc = doc.search()

        databases
    end

    def self.all
        # pull up all of the links, everything on the page
  
    end

    def self.find_by_keyword(keyword)
    	self.all.detect do |item|
    		item.keyword.downcase.strip == keyword.downcase.strip
    	end
    end




end
