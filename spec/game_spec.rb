require "spec_helper"
require "codebreaker/game"

describe Codebreaker::Game do 
  let!(:game){Codebreaker::Game.new}
  let!(:random_strin){Codebreaker::Code_generator.new}
  
  context ".new" do
    it "instantiates a Game object with 0 attempts by default" do 
      expect(game.attempts_number).to eq(0)
    end
    it "instantiates a Game object with code value equals 4 by default" do 
      expect(game.code_length).to eq(4)
    end 
  end
  let(:code_generator){double :code_generator}
  context "#new_game" do
    xit "starts a new game with string with number from 1 to 6" do
      code_generator.should_receive(:random).with(@code_length).and_return "1234"
      game.new_game
      expect(game.random_string).to match /[1-6]{4}$/ 
    end
    xit "generates new random srting 4 digit length" do
      game.new_game
      expect(game.random_string).to match /[1-6]{4}$/ 
    end
  end 
  context "#hint" do
    let(:game){Codebreaker::Game.new}
    it "shows a hint for a secret string" do 
      game.stub(:hint).and_return "1"
    end 
  end
  
  before do
    @stringy = "1234"
  end
  context "#comparator" do  
    it "returns pluses when guessed in right order" do
        expect(game.comparator @stringy, "1234" ).to eq "++++"
        expect(game.comparator @stringy, "5255" ).to eq "+" 
      end

      it "returns minuses when guessed in wrong order" do
        expect(game.comparator @stringy,"2341" ).to eq "----" 
        expect(game.comparator @stringy, "5651" ).to eq "-" 
      end

    it "returns mix of munuses and pluses when guessed in right and wrong order" do
        expect(game.comparator @stringy,"4132").to eq "--+-" 
        expect(game.comparator @stringy,"1356").to eq "+-" 
    end
  end 

  context "#reset" do
  end

  context "#attempts_taken" do
    it "writes a failure message to errors array if not enough attempts" do 
      @attempts = 0
      game.attempts_taken
      expect(game.errors).not_to be_empty
    end

    xit "decreases a number if attempts by one for each call" do
      @attempts = 1
      expect(game.attempts_taken).to change(game.attempts_number).from(1).to(0)
    end
  end
end
