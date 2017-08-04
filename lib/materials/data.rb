require "open-uri"
require "nokogiri"
require "pry"

class MaterialsData::Database

    attr_accessor :database, :title, :url, :desc, :keyword

#    def initialize(keyword)
#    	@keyword = keyword
#    end


    def self.scrape_nist # only one website to be scraped
        @databases = []
        doc = Nokogiri::HTML(open("https://srdata.nist.gov/gateway/gateway?dblist=1"))
       # rows = doc.xpath("//table/tbody")
        binding.pry
    #    database = self.new
     #   database.title = doc.search() # text of the link
      #  database.url = doc.search() # URL of the database
       # database.desc = doc.search() # paragraph description of the database
        #@databases << self


    end

    def self.all
        # pull up all of the links, everything on the page
#        databases = []
#        databases << self.scrape_nist
#       databases
        puts <<-DOC.gsub /^\s*/, ''
            1. 8-Bit Gray Scale Images of Fingerprint Image Groups
            2. AnthroKids - Anthropometric Data of Children
            3. Atlas of the Spectrum of a Platinum/Neon Hollow-Cathode Lamp in the Region 1130-4330 Å
        DOC
    end

    def self.find_by_keyword(keyword)
    	self.all.detect do |item|
    		item.keyword.downcase.strip == keyword.downcase.strip
    	end
    end




end
