module Codebreaker
  class Storage
    def save_results
      File.open(f_name, 'w') { |file| file.write(" Player: #{@player.user_name} finished game.\n Number of attempts: #{@attempts_number}") }	
    end
  end
end
