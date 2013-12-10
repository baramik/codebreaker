require "spec_helper"
require "codebreaker/user"

describe Codebreaker::User do 
  
  let!(:new_user){Codebreaker::User.new("Baramik")} 
  let!(:validator){Codebreaker::Validator.new}
  
  before do 
    @valid_guess = "1234"
    @invalid_guess = "9999"
  end
  
  context ".new" do 
      it "creates a new user with 0 points of score" do 
        expect(new_user.score).to eq(0)
      end
      it "creates a new user with a Username" do 
        expect(new_user.user_name).not_to eq("")  
      end

  end 

  context "#user_guess" do  
    it "saves user's guess valid string to a variable" do 
       new_user.user_guess(@valid_guess)
       expect(new_user.guess_string).to eq("1234")
    end
    it "puts an error when user's guess is invalid" do
       new_user.user_guess(@invalid_guess)
       expect(validator.errors.length > 0)
    end
  end

  context "#points_counter" do 
    xit "changes ingrements points number by 50 for each call" do
      expect(new_user.points_counter).to change(new_user.score).by(50)
    end
  end 
end
