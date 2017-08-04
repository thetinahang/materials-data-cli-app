class MaterialsData::CLI

	def call
		menu
		goodbye
	end 

	def get_databases #here doc?
		@databases = MaterialsData::Database.all
	end	
	
	def menu
		puts "NIST Online Databases"
		input = nil
		while input != "exit"
			puts "Please pick a keyword that accurately describes what you're looking for, or type exit:"
			puts "Here are your options: "
			puts "energy or energies"
			puts "thermodynamic"
			puts "structure"
			puts "algorithms"
			puts "algorithms"
			puts "statistical analysis"
			puts "list -- to see all the databases" 
			input = gets.strip.downcase
			case input
				when "energy" 
					puts "Here are the databases for the keyword, energy: "
				when "energies" 
					puts "Here are the databases for the keyword, energies: "
				when "thermodynamic" 
					puts "Here are the databases for the keyword, thermodynamic: "
				when "structure" 
					puts "Here are the databases for the keyword, structure: "
				when "algorithms" 
					puts "Here are the databases for the keyword, algorithms: "
				when "statistical analysis" 
					puts "Here are the databases for the keyword, statistical analysis: "
				when "list"
					get_databases
				else
					puts "Not sure what you want, type list or exit."
			end
		end
	end

	def goodbye
		puts "Thank you for checking out this gem!"
	end

end