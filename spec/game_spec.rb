require './lib/game'
require './lib/actions'
require './lib/valera'
require 'json'

RSpec.describe Game do
  let(:actions) { Actions.new }
  let(:game) { Game.new }
  let(:file) { File.read('../valera/configurate.json') }
  let(:app) { JSON.parse(file) }
  let(:actions_array) { Actions.new.fetching_actions(app) }
  let(:valera) { Valera.new }

  describe 'perform action!' do
    context 'action_item = 4' do
      #let(:game.action_item) { 4 }
      it {
        status =
          {
            'health' => 100,
            'mana' => 100,
            'fun' => 0,
            'fatigue' => 0,
            'money' => 0
          }
        new_status =
          {
            'health' => 100,
            'mana' => 90,
            'fun' => 1,
            'fatigue' => 10,
            'money' => 0
          }
        game.action_item = 4
        valera = game.perform_action!(status, app, actions_array)
        expect(valera.status).to eq new_status
      }
    end
  end
end