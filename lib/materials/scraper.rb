class MaterialsData::Scraper

	def self.scrape_nist(keyword) 
        doc = Nokogiri::HTML(open("http://nist.matdl.org/dspace/xmlui/community-list"))
        
        
        case keyword
            when "comp" # NIST Computational File Repository
                comp = MaterialsData::Database.new
                comp.titles = doc.search("//ul/li[1]/ul/li/div/div/a/span").text.split(/[a-z](?=[A-Z])/)
                comp.urls = doc.search("//ul/li[1]/ul/li/div/div/a/@href").text.gsub(/\/dspace/, "-https://materialsdata.nist.gov/dspace").split("-")
                comp
            when "exp" # NIST Experimental Data Repository
                exp = MaterialsData::Database.new
                exp.titles = doc.search("//ul/li[2]/ul/li/div/div/a/span").text.split(/[a-z](?=[A-Z])/)
                exp.urls = doc.search("//ul/li[2]/ul/li/div/div/a/@href").text.gsub(/\/dspace/, "-https://materialsdata.nist.gov/dspace").split("-")
                exp
            when "struc" # NIST Structural Materials Data Demonstration Project ASM
                struc = MaterialsData::Database.new
                struc.titles = doc.search("//ul/li[3]/ul/li/div/div/a/span").text.split(/[a-z](?=[0-9]|[A-Z])/)
                struc.urls = doc.search("//ul/li[3]/ul/li/div/div/a/@href").text.gsub(/\/dspace/, "-https://materialsdata.nist.gov/dspace").split("-")
                struc
            when "rda" # RDA Demonstration Project: DTR/PID & MGI Infrastructure
                rda = MaterialsData::Database.new
                rda.titles = doc.search("//ul/li[4]/ul/li/div/div/a/span").text.split(/[a-z](?=[A-Z]|\()/) 
                rda.urls = doc.search("//ul/li[4]/ul/li/div/div/a/@href").text.gsub(/\/dspace/, "-https://materialsdata.nist.gov/dspace").split("-")
                rda
            when "tms" # TMS Springer Integrating Materials and Manufacturing Innovation (IMMI)
                tms = MaterialsData::Database.new
                tms.titles = doc.search("//ul/li[5]/ul/li/div/div/a/span").text.split(/[a-z](?=[A-Z])/)
                tms.urls = doc.search("//ul/li[5]/ul/li/div/div/a/@href").text.gsub(/\/dspace/, "-https://materialsdata.nist.gov/dspace").split("-")
                tms           
        end

    end
    
end