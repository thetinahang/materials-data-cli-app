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
			puts "Please pick a number that is associated to what you're looking for, or type exit:"
			puts "Here are your options: "
			puts "1 - Computational File Repository"
			puts "2 - Experimental Data Repository"
			puts "3 - Structural Materials Data Demonstration Project ASM"
			puts "4 - RDA Demonstration Project: DTR/PID & MGI Infrastructure"
			puts "5 - TMS Springer Integrating Materials and Manufacturing Innovation (IMMI)"
			puts "6 - list -- to see all the databases" 
			input = gets.strip.downcase
			case input #use each 
				when "1" 
					puts "Here are the databases under Computational File Repository: "
				when "2" 
					puts "Here are the databases under Experimental Data Repository: "
				when "3" 
					puts "Here are the databases under Structural Materials Data Demonstration Project ASM: "
				when "4" 
					puts "Here are the databases under RDA Demonstration Project: DTR/PID & MGI Infrastructure: "
				when "5" 
					puts "Here are the databases under TMS Springer Integrating Materials and Manufacturing Innovation (IMMI): "
				when "6" 
					get_databases
				when "exit"
					goodbye
				else #this puts even when we enter exit
					puts "Not sure what you want, type list or exit."
			end
		end
	end

	def goodbye
		puts "Thank you for checking out this gem!"
	end

end