class MaterialsData::CLI

	def call
		puts "NIST Online Databases:"
		get_databases
	end 

	def get_databases #here doc?
		puts "1. 8-Bit Gray Scale Images of Fingerprint Image Groups"
		puts "2. AnthroKids - Anthropometric Data of Children "
		puts "3. Atlas of the Spectrum of a Platinum/Neon Hollow-Cathode Lamp in the Region 1130-4330 Å "
	end	
	
end