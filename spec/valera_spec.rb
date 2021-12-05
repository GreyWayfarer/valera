require './lib/valera'

RSpec.describe Valera do
  describe 'dead?' do
    valera = Valera.new
    context 'Health is negative' do
      status = {
        'health' => -1,
        'mana' => 7,
        'fun' => 10,
        'money' => 5,
        'fatigue' => 15
      }
      it { expect(valera.dead?(status)).to eq(true) }
    end
    valera = Valera.new
    context 'Fatigue is over 100' do
      status = {
        'health' => 1,
        'mana' => 7,
        'fun' => 10,
        'money' => 5,
        'fatigue' => 100
      }
      it { expect(valera.dead?(status)).to eq(true) }
    end
  end
end
