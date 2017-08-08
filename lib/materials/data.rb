require "open-uri"
require "nokogiri"
require "pry"

class MaterialsData::Database

    attr_accessor :database_list, :titles, :urls, :input

 #   def initialize
  #      @database_list = database_list
   # end

    def self.scrape_nist(input) # only one website to be scraped
        databases =[]
        doc = Nokogiri::HTML(open("http://nist.matdl.org/dspace/xmlui/community-list"))
        
        
        case input
            when "comp" # NIST Computational File Repository
                comp = self.new
                comp.titles = doc.search("//ul/li[1]/ul/li/div/div/a/span").text.split(/[a-z](?=[A-Z])/)
                comp.urls = doc.search("//ul/li[1]/ul/li/div/div/a/@href").text.gsub(/\/dspace/, "-https://materialsdata.nist.gov/dspace").split("-")
                display_comp = comp.urls.zip(comp.titles)
                puts display_comp
                comp
            when "exp" # NIST Experimental Data Repository
                exp = self.new
                exp.titles = doc.search("//ul/li[2]/ul/li/div/div/a/span").text.split(/[a-z](?=[A-Z])/)
                exp.urls = doc.search("//ul/li[2]/ul/li/div/div/a/@href").text.gsub(/\/dspace/, "-https://materialsdata.nist.gov/dspace").split("-")
                display_exp = exp.urls.zip(exp.titles)
                puts display_exp
                exp
            when "struc" # NIST Structural Materials Data Demonstration Project ASM
                struc = self.new
                struc.titles = doc.search("//ul/li[3]/ul/li/div/div/a/span").text.gsub(/[a-z](?=[0-9])/, "\n").split(/[a-z](?=[A-Z])/)
                struc.urls = doc.search("//ul/li[3]/ul/li/div/div/a/@href").text.gsub(/\/dspace/, "-https://materialsdata.nist.gov/dspace").split("-")
                display_struc = struc.urls.zip(struc.titles)
                puts display_struc
                struc
            when "rda" # RDA Demonstration Project: DTR/PID & MGI Infrastructure
                rda = self.new
                rda.titles = doc.search("//ul/li[4]/ul/li/div/div/a/span").text.gsub(/[a-z](?=\()/, "\n").split(/[a-z](?=[A-Z])/)
                rda.urls = doc.search("//ul/li[4]/ul/li/div/div/a/@href").text.gsub(/\/dspace/, "-https://materialsdata.nist.gov/dspace").split("-")
                display_rda = rda.urls.zip(rda.titles)
                puts display_rda
                rda
            when "tms" # TMS Springer Integrating Materials and Manufacturing Innovation (IMMI)
                tms = self.new
                tms.titles = doc.search("//ul/li[5]/ul/li/div/div/a/span").text.split(/[a-z](?=[A-Z])/)
                tms.urls = doc.search("//ul/li[5]/ul/li/div/div/a/@href").text.gsub(/\/dspace/, "-https://materialsdata.nist.gov/dspace").split("-")
                display_tms = tms.urls.zip(tms.titles)
                puts display_tms
                tms
            when "list" 
                all              
        end

    end

    def self.all
       databases = []
        databases << self.scrape_nist("comp")
        databases << self.scrape_nist("exp")
        databases << self.scrape_nist("struc")
        databases << self.scrape_nist("rda")
        databases << self.scrape_nist("tms")
       databases
#        puts <<-DOC.gsub /^\s*/, ''
 #           1. 8-Bit Gray Scale Images of Fingerprint Image Groups
  #          2. AnthroKids - Anthropometric Data of Children
   #         3. Atlas of the Spectrum of a Platinum/Neon Hollow-Cathode Lamp in the Region 1130-4330 Å
    #    DOC
    end

    def self.find_by_keyword(keyword)
    	self.all.detect do |item|
    		item.keyword.downcase.strip == keyword.downcase.strip
    	end
    end




end
