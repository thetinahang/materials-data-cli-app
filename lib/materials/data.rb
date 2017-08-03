require "materials/data/version"
require "nokogiri"
require "pry"

class Materials::Database

    attr_accessor :database, :title, :link, :desc, :keyword

#    def initialize(keyword)
#    	@keyword = keyword
#    end


    def self.scrape_nist # only one website to be scraped
        doc = Nokogiri::HTML(open("https://srdata.nist.gov/gateway/gateway?dblist=1"))
        database = self.new
        database.title = doc.search() # text of the link
        database.link = doc.search() # URL of the database
        database.desc = doc.search() # paragraph description of the database
        database

        binding.pry
    end

    def self.all
        # pull up all of the links, everything on the page
        databases = []
        databases << self.scrape_nist
        databases
    end

    def self.find_by_keyword(keyword)
    	self.all.detect do |item|
    		item.keyword.downcase.strip == keyword.downcase.strip
    	end
    end




end
