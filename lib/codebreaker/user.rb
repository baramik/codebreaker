module Codebreaker
	class User
		attr_reader :user_name, :guess_string
		attr_accessor :score
		def initialize(user_name)
			@user_name = user_name
			@score = 0
			@validator = Validator.new
		end

		def user_guess(guess)
			@validator.valid?(guess)
			if @validator.errors.empty?
			  @guess_string = guess 
			else
			  @validator.errors 	
			end 	  	
		end

		def points_counter
			@score += 50
		end
	end
end