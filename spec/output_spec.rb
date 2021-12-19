require './lib/output'
require 'json'

RSpec.describe Output do
  let(:file) { File.read('../valera/configurate.json') }
  let(:configurate) { JSON.parse(file) }
  let(:actions_array) { [] }
  let(:status) do
    {
      'health' => -1,
      'mana' => 7,
      'fun' => 10,
      'money' => 5,
      'fatigue' => 15
    }
  end
  let(:out) { "HP: -1\nMana: 7\nFun: 10\nMoney: 5\nFatigue: 15\n\n" }
  describe '#print_actions' do
    out = "0. Exit\n1. Save\n2. Load\n3. Go work\n4. Walk in the park\n"
    it 'Output print actions' do
      expect do
        configurate.each_key { |key| actions_array.push key }
        Output.print_actions(actions_array)
      end.to output(out).to_stdout
    end
  end
  describe '#print_status' do
    it 'Output print status' do
      expect do
        Output.print_status(status)
      end.to output(out).to_stdout
    end
  end
end
