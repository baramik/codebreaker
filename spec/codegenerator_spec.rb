require "spec_helper"
require "codebreaker/codegenerator"

describe Codebreaker::Code_generator do 
	let(:new_generator){Codebreaker::Code_generator.new}
	context ".new" do 
		it "instatiate a new Code_generator with empty string" do 
			expect(new_generator.random_string).to be_empty
		end		
	end

	context "#random" do
		it "creates a new random string" do
			expect(new_generator.random) == 4
		end
	end
end