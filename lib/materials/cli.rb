class MaterialsData::CLI

	def call
		menu
		goodbye
	end 

	def get_databases
		@databases = MaterialsData::Database.all
	end	
	
	def menu
		puts "NIST Repositories:"
		input = nil
		while input != "exit"
			puts "Please pick a number that is associated to what you're looking for, or type exit:"
			puts "Here are your options: "
			puts "Computational File Repository"
			puts "Experimental Data Repository"
			puts "Structural Materials Data Demonstration Project ASM"
			puts "RDA Demonstration Project: DTR/PID & MGI Infrastructure"
			puts "TMS Springer Integrating Materials and Manufacturing Innovation (IMMI)"
			puts "list -- to see all the databases" 
			input = gets.strip.downcase
			case input #use each 
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
				else #this puts even when we enter exit
					puts "Not sure what you want, type list or exit."
			end
		end
	end

	def goodbye
		puts "Thank you for checking out this gem!"
	end

end