module Codebreaker
	class Game
		attr_reader :attempts_number, :hint_string, :result, :random_string, :code_length, :errors
		def initialize(attempts_number = 0, code_length = 4)
			@attempts_number = attempts_number
			@code_length = code_length 
			@hint_string
			@random_string
			@errors = []
		end

		def new_game			
		    @random_string = code_generator.random(@code_length)
		    reset
		    @random_string
		end

		def comparator(random_string, guess_string)
			@result = ""
    		guess_string.each_char.each_with_index do |digit, i|
	        	if guess_string[i] == random_string[i]
	           		@result << "+"
	        	elsif random_string.include? digit
	           		@result << "-"
	        	end
    		end    
    		@result
		end

		def hint
			@hint_string = @random_string[rand(3)]
		end

		def attempts_taken
			@attempts_number > 0 ? @attempts_number -= 1 : (@errors << "No attempts left") 
		end

		def reset
			@attempts_number = 3
		end

	end
end