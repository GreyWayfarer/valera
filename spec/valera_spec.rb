require './lib/valera'

RSpec.describe Valera do
  describe '#dead?' do
    let(:valera) { Valera.new }
    context 'Health is negative' do
      let(:status) do
        {
          'health' => -1,
          'mana' => 7,
          'fun' => 10,
          'money' => 5,
          'fatigue' => 15
        }
      end
      it { expect(valera.dead?(status)).to eq(true) }
    end
    context 'Fatigue is over 100' do
      let(:status) do
        {
          'health' => 1,
          'mana' => 7,
          'fun' => 10,
          'money' => 5,
          'fatigue' => 101
        }
      end
      it { expect(valera.dead?(status)).to eq(true) }
    end
    context 'All normal' do
      let(:status) do
        {
          'health' => 1,
          'mana' => 7,
          'fun' => 10,
          'money' => 5,
          'fatigue' => 15
        }
      end
      it { expect(valera.dead?(status)).to eq(false) }
    end
    context 'Rebuild status' do
      let(:status) do
        {
          'health' => 122,
          'mana' => 7,
          'fun' => 12,
          'money' => 5,
          'fatigue' => 100
        }
      end
      let(:expected_status) do
        {
          'health' => 100,
          'mana' => 40,
          'fun' => 0,
          'money' => 0,
          'fatigue' => 0
        }
      end
      it {
        valera.check_status!(status)
        expect(valera.status).to eq(expected_status)
      }
    end
  end
end
