require_relative 'valera'

class Actions
  def fetching_actions(configurate)
    actions_array = []
    configurate.each_key { |key| actions_array.push key }
    actions_array
  end

  def read_actions(game)
    game.action_item = gets.chomp.to_i
    return unless game.action_item.negative? || (game.action_item > 9)
  end
end
