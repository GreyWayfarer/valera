require './lib/output'
require 'json'

RSpec.describe Output do
  describe '#print_actions' do
    file = File.read('../valera/configurate.json')
    configurate = JSON.parse(file)
    actions_array = []
    configurate.each_key { |key| actions_array.push key }
    out = "0. Exit\n1. Save\n2. Load\n3. Go work\n4. Walk in the park\n"
    it 'Output print actions' do
      expect do
        Output.print_actions(actions_array)
      end.to output(out).to_stdout
    end
  end
  describe '#print_status' do
    status = {
      'health' => -1,
      'mana' => 7,
      'fun' => 10,
      'money' => 5,
      'fatigue' => 15
    }
    out = "HP: -1\nMana: 7\nFun: 10\nMoney: 5\nFatigue: 15\n\n"
    it 'Output print status' do
      expect do
        Output.print_status(status)
      end.to output(out).to_stdout
    end
  end
end
