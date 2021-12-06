class Output
  class << self
    def print_actions(actions_array)
      puts '0. Exit'
      puts '1. Save'
      puts '2. Load'
      actions_array.map.with_index { |action, i| puts "#{i + 3}. #{action}\n" }
    end

    def print_status(status)
      puts "HP: #{status['health']}\n"
      puts "Mana: #{status['mana']}\n"
      puts "Fun: #{status['fun']}\n"
      puts "Money: #{status['money']}\n"
      puts "Fatigue: #{status['fatigue']}\n\n"
    end
  end
end
