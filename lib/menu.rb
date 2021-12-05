class Menu
  def self.print_actions(actions_array)
    actions_array.map.with_index { |action, i| puts "#{i + 1}. #{action}\n" }
    puts '0. Exit'
  end
end
