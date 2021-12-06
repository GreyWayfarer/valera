require_relative 'actions'
require_relative 'valera'
require_relative 'output'
require_relative 'game'
require 'json'

class Application
  def initialize
    @valera = Valera.new
    @actions = Actions.new
    @game = Game.new
  end

  def configurate_open
    file = File.read('../valera/configurate.json')
    JSON.parse(file)
  end

  def run
    configurate = configurate_open
    actions_array = @actions.fetching_actions(configurate)

    loop do
      Output.print_status(@valera.status)
      Output.print_actions(actions_array)
      @actions.read_actions(@game)
      @game.perform_action!(@valera.status, configurate, actions_array)

      abort 'The End' if @valera == false
    end
  end
end
