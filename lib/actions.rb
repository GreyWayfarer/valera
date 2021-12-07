require_relative 'valera'

class Actions
  def fetching_actions(configurate)
    actions_array = []
    configurate.each_key { |key| actions_array.push key }
    actions_array
  end

  def read_actions(game)
    loop do
      game.action_item = gets.chomp.to_i
      return unless game.action_item.negative? || (game.action_item > 4)

      puts 'illegal action, repeat'
    end
  end

  def change(field, key)
    field.send key['operator'], key['value'].to_i
  end

  def change_status(status, action)
    action.each { |key, value| status[key] = change(status[key], value) }
    status
  end

  def check_conds(status, action)
    action.each { |field, key| return false unless change(status[field], key) }
    true
  end

  def select_action(status, action)
    unless action['conds'].nil?
      return unless check_conds(status, action['conds'])

      status = change_status(status, action['effects'])
    end
    status
  end

  def execute!(status, action)
    upd_action = select_action(status, action)
    puts "You can't do it" if upd_action.nil?
    upd_action
  end
end
