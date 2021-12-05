require_relative 'valera'

class Actions
  def fetching_actions(configurate)
    actions_array = []
    configurate.each_key { |key| actions_array.push key }
    actions_array
  end
end
