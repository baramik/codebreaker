module Codebreaker
  class Code_generator
    attr_reader :random_string
    def initialize
      @random_string = String.new	
    end
    def random(code_length = 4)
      code_length.times{@random_string << rand(1..6).to_s}
      @random_string
    end 
  end
end
