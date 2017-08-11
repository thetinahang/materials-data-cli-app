class MaterialsData::Database

    attr_accessor :titles, :urls

    def self.display(keyword)
        display = MaterialsData::Scraper.scrape_nist(keyword).urls.zip(MaterialsData::Scraper.scrape_nist(keyword).titles)
        puts display
    end

    def self.all
        display("comp")
        display("exp")
        display("struc")
        display("rda")
        display("tms")
    end

end
