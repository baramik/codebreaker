require "spec_helper"
require "codebreaker/validator"

describe Codebreaker::Validator do 
  before do
    @valid_guess = "1234"
    @invalid_guess = "9999"
  end
  let(:validator){Codebreaker::Validator.new}
  context ".new" do
    it "instantiates a new validator with empty errors array" do 
      expect(validator.errors.is_a?Array).to be_true
      expect(validator.errors).to be_empty
    end
  end 


  context "#valid?" do
    it "retuns true when input string is valid" do
      expect(validator.valid?(@valid_guess)).to be_true
    end

    it "returns false when input string is invalid" do
      validator.valid?(@invalid_guess)
      expect(validator.errors.empty?).to be_false
    end 
  end 
end
