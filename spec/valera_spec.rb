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
    context 'Fatigue is over 100' do
      status = {
        'health' => 1,
        'mana' => 7,
        'fun' => 10,
        'money' => 5,
        'fatigue' => 101
      }
      it { expect(valera.dead?(status)).to eq(true) }
    end
    context 'All normal' do
      status = {
        'health' => 1,
        'mana' => 7,
        'fun' => 10,
        'money' => 5,
        'fatigue' => 15
      }
      it { expect(valera.dead?(status)).to eq(false) }
    end
    context 'Rebuild status' do
      status = {
        'health' => 122,
        'mana' => 7,
        'fun' => 12,
        'money' => 5,
        'fatigue' => 100
      }
      expected_status = {
        'health' => 100,
        'mana' => 100,
        'fun' => 0,
        'money' => 0,
        'fatigue' => 0
      }
      valera.check_status!(status)
      it { expect(valera.status).to eq(expected_status) }
    end
  end
end
