require './lib/game'
require './lib/actions'

RSpec.describe Game do
  describe 'perform action!' do
    actions = Actions.new
    context 'action_item = 0' do
      game = Game.new
      file = File.read('../valera/configurate.json')
      app = JSON.parse(file)
      actions_array = actions.fetching_actions(app)
      status = {
        'health' => 100,
        'mana' => 30,
        'happienss' => 5,
        'fatigue' => 0,
        'money' => 100
      }
      game.action_item = 0
      it 'Leaving the game' do
        expect do
          game.perform_action!(status, app, actions_array).call(game.valera)
        rescue SystemExit
          nil
        end.to output("Exit\n").to_stderr
      end
    end
  end
end
