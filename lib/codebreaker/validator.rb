module Codebreaker
  class Validator
    attr_reader :errors
    def initialize
       @errors = []
    end
    def valid?(ins)
        if ins =~ /[1-6]{4}$/ 
           @errors = []
        else 
           @errors << "Invalid input value"
        end	
	  end
   end
end  