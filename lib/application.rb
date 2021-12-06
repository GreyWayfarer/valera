require_relative 'actions'
require_relative 'valera'
require_relative 'menu'
require 'json'

class Application
  def initialize
    @valera = Valera.new
    @actions = Actions.new
  end

  def configurate_open
    file = File.read('../valera/configurate.json')
    JSON.parse(file)
  end

  def run
    configurate = configurate_open
    actions_array = @actions.fetching_actions(configurate)

    loop do
      puts "HP: #{@valera.status['health']}\n"
      puts "Mana: #{@valera.status['mana']}\n"
      puts "Fun: #{@valera.status['fun']}\n"
      puts "Money: #{@valera.status['money']}\n"
      puts "Fatigue: #{@valera.status['fatigue']}\n\n"

      Menu.print_actions(actions_array)
      Action.read_actions(game)
      Game.perform_action!(status, configurate, actions_array)

      if @valera.dead?(@valera.status) == true
        puts 'The End'
        exit
      end
    end
  end
end
