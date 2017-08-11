class MaterialsData::CLI

	KEYWORDS = ["comp", "exp", "struc", "rda", "tms", "list", "exit"]

	def call
		menu
	end 

	def get_databases
		@databases = MaterialsData::Database.all
	end	
	
	def menu
		puts "NIST Repositories:"
		input = nil
		while input != "exit"
			puts "Please pick a number that is associated to a keyword you're looking for, or type exit:"
			puts "Here are your options: "
			puts "1 - comp - Computational File Repository"
			puts "2 - exp - Experimental Data Repository"
			puts "3 - struc - Structural Materials Data Demonstration Project ASM"
			puts "4 - rda - RDA Demonstration Project: DTR/PID & MGI Infrastructure"
			puts "5 - tms - TMS Springer Integrating Materials and Manufacturing Innovation (IMMI)"
			puts "6 - list - to see all the databases" 
			input = gets.strip.downcase

			if input.to_i.between?(1,6)
				keyword = KEYWORDS[input.to_i - 1]
				puts "Here are the databases for the keyword you picked:"
				MaterialsData::Scraper.scrape_nist(keyword)
			elsif input == "exit"
				goodbye
			else
				puts "Not sure what you want, type list or exit."
			end

		end
	end

	def goodbye
		puts "Thank you for checking out this gem!"
	end

end