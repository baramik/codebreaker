module Codebreaker
  class Storage
    def save_results
      File.open(f_name, 'w') { |file| file.write(" Player: #{@player.name} finished game.\n Number of attempts: #{@number_of_attempts}") }	
    end
  end
end
