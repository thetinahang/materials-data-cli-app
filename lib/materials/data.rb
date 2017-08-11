class MaterialsData::Database

    attr_accessor :titles, :urls



    def self.all
        databases = []
            databases << MaterialsData::Scraper.scrape_nist("comp")
            databases << MaterialsData::Scraper.scrape_nist("exp")
            databases << MaterialsData::Scraper.scrape_nist("struc")
            databases << MaterialsData::Scraper.scrape_nist("rda")
            databases << MaterialsData::Scraper.scrape_nist("tms")
        databases
    end

end
