require_relative 'valera'
require_relative 'actions'

class Game
  attr_accessor :valera, :actions, :action_item

  def initialize
    @valera = Valera.new
  end

  def perform_action!(status, configurate, actions_array)
    abort 'Exit' if action_item.zero?
    selected_action = configurate[actions_array[action_item - 1]]
    Actions.new.execute!(status, selected_action)
    @valera.check_status!(@valera.status)
    return abort 'YOU DIED. RETRY?' if @valera.dead?(@valera.status)

    valera
  end
end
