require './lib/game'
require './lib/actions'
require './lib/valera'
require 'json'

RSpec.describe Game do
  describe '#perform action!' do
    let(:actions) { Actions.new }
    let(:game) { Game.new }
    let(:file) { File.read('../valera/configurate.json') }
    let(:app) { JSON.parse(file) }
    let(:actions_array) { Actions.new.fetching_actions(app) }
    let(:valera) { Valera.new }
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
      it {
        game.action_item = 4
        valera = game.perform_action!(status, app, actions_array)
        expect(valera.status).to eq new_status
      }
    end
  end
end
