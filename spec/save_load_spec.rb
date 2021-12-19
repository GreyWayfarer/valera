require './lib/save_load'

RSpec.describe Saver do
  describe '#save_game' do
    context 'Try save game' do
      let(:status) do
        {
          'health' => 100,
          'mana' => 30,
          'fun' => 5,
          'fatigue' => 0,
          'money' => 100
        }
      end
      let(:file) { '{"health":100,"mana":30,"fun":5,"fatigue":0,"money":100}' }
      it {
        allow($stdin).to receive(:gets).and_return('test_save')
        Saver.save_game(status)
        new_file = File.read('../valera/saves/test_save.json')
        expect(new_file).to eq file
      }
    end
  end
  describe '#load_game' do
    context 'Try load game' do
      let(:status) do
        {
          'health' => 100,
          'mana' => 30,
          'fun' => 5,
          'fatigue' => 0,
          'money' => 100
        }
      end
      it {
        allow($stdin).to receive(:gets).and_return('test_save')
        curr_status = Saver.load_game
        expect(curr_status).to eq status
      }
    end
  end
end
