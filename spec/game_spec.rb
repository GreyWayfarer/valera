require './lib/game'
require './lib/actions'
require './lib/valera'
require 'json'

RSpec.describe Game do
  actions = Actions.new
  game = Game.new
  file = File.read('../valera/configurate.json')
  app = JSON.parse(file)
  actions_array = actions.fetching_actions(app)

  describe 'perform action!' do
    context 'action_item = 4' do
      let(:status) do
        {
          'health' => 100,
          'mana' => 100,
          'fun' => 0,
          'fatigue' => 0,
          'money' => 0
        }
      end
      let(:new_status) do
        {
          'health' => 100,
          'mana' => 90,
          'fun' => 1,
          'fatigue' => 10,
          'money' => 0
        }
      end
      valera = Valera.new
      game.action_item = 4
      it {
        valera = game.perform_action!(status, app, actions_array)
        expect(valera.status).to eq new_status
      }
    end
  end
end
