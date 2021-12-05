# require_relative 'actions'
require_relative 'valera'
require 'json'

class Application
  def initialize
    @valera = Valera.new
    # @actions = Actions.new
  end

  def configurate_open
    file = File.read('../valera/configurate.json')
    JSON.parse(file)
  end

  def run
    # configurate = configurate_open
    # actions_array = @actions.fetching_actions(configurate)
    # function for extracting a list of actions from a configuration
    loop do
      puts "HP: #{@valera.status['health']}\n"
      puts "Mana: #{@valera.status['mana']}\n"
      puts "Fun: #{@valera.status['fun']}\n"
      puts "Fatigue: #{@valera.status['fatigue']}\n"
      puts "Money: #{@valera.status['money']}\n\n"

      # actions

      if @valera.dead?(@valera.status) == true
        puts 'The End'
        exit
      end
    end
  end
end

Application.new.run
