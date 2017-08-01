require "materials/data/version"
require "nokogiri"

module Materials
  module Data
    # Your code goes here...
    attr_accessor :keyword

    def initialize(keyword)
    	@keyword = keyword
    end

    def self.all
    end

    def self.find_by_keyword(keyword)
    	self.all.detect do |item|
    		item.keyword.downcase.strip == keyword.downcase.strip
    	end
    end




  end
end
