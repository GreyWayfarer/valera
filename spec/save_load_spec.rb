require './lib/save_load'

RSpec.describe Saver do
  describe '#save_game' do
    context 'Try save game' do
      status = {
        'health' => 100,
        'mana' => 30,
        'fun' => 5,
        'fatigue' => 0,
        'money' => 100
      }

      it {
        allow($stdin).to receive(:gets).and_return('test_save')
        Saver.save_game(status)
        curr_status = Saver.load_game
        expect(curr_status).to eq status
      }
    end
  end
end
