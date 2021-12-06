require_relative 'valera'
require_relative 'actions'
require_relative 'save_load'

class Game
  attr_accessor :valera, :actions, :action_item

  def initialize
    @valera = Valera.new
    @actions  = Actions.new
  end

  def perform_action!(status, configurate, actions_array)
    abort 'Exit' if action_item.zero?
    Saver.save_game(status) if action_item == 1
    @valera.status = Saver.load_game if action_item == 2
    if action_item > 2
      selected_action = configurate[actions_array[action_item - 3]]
      @valera.status = @actions.execute!(status, selected_action)
    end
    @valera.check_status!(@valera.status)
    return abort 'YOU DIED. RETRY?' if @valera.dead?(@valera.status)

    @valera
  end
end
