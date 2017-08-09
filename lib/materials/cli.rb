class MaterialsData::CLI

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
			puts "Please pick a keyword that is associated to what you're looking for, or type exit:"
			puts "Here are your options: "
			puts "comp - Computational File Repository"
			puts "exp - Experimental Data Repository"
			puts "struc - Structural Materials Data Demonstration Project ASM"
			puts "rda - RDA Demonstration Project: DTR/PID & MGI Infrastructure"
			puts "tms - TMS Springer Integrating Materials and Manufacturing Innovation (IMMI)"
			puts "list - to see all the databases" 
			input = gets.strip.downcase
			case input 
				when "comp" 
					puts "Here are the databases under Computational File Repository: "
					MaterialsData::Database.scrape_nist(input)
				when "exp" 
					puts "Here are the databases under Experimental Data Repository: "
					MaterialsData::Database.scrape_nist(input)
				when "struc" 
					puts "Here are the databases under Structural Materials Data Demonstration Project ASM: "
					MaterialsData::Database.scrape_nist(input)
				when "rda" 
					puts "Here are the databases under RDA Demonstration Project: DTR/PID & MGI Infrastructure: "
					MaterialsData::Database.scrape_nist(input)
				when "tms" 
					puts "Here are the databases under TMS Springer Integrating Materials and Manufacturing Innovation (IMMI): "
					MaterialsData::Database.scrape_nist(input)
				when "list" 
					MaterialsData::Database.scrape_nist(input)
				when "exit"
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