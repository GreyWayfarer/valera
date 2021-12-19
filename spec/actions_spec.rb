require './lib/actions'

RSpec.describe Actions do
  describe '#execute!' do
    let(:status) do
      {
        'health' => 100,
        'mana' => 30,
        'happienss' => 5,
        'fatigue' => 0,
        'money' => 100
      }
    end
    context 'Go work' do
      let(:go_work_action) do
        {
          'conds' => {
            'mana' => {
              'value' => '50',
              'operator' => '<'
            },
            'fatigue' => {
              'value' => '10',
              'operator' => '<'
            }
          },
          'effects' => {
            'happienss' => {
              'value' => '5',
              'operator' => '-'
            },
            'mana' => {
              'value' => '30',
              'operator' => '-'
            },
            'money' => {
              'value' => '100',
              'operator' => '+'
            },
            'fatigue' => {
              'value' => '70',
              'operator' => '+'
            }
          }
        }
      end
      let(:expected) do
        {
          'fatigue' => 70,
          'happienss' => 0,
          'health' => 100,
          'mana' => 0,
          'money' => 200
        }
      end
      it { expect(Actions.new.execute!(status, go_work_action)).to eq expected }
    end
    context 'Walk in the park' do
      let(:walk_in_the_park_action) do
        {
          'conds' => {
          },
          'effects' => {
            'happienss' => {
              'value' => '1',
              'operator' => '+'
            },
            'mana' => {
              'value' => '10',
              'operator' => '-'
            },
            'fatigue' => {
              'value' => '10',
              'operator' => '+'
            }
          }
        }
      end
      let(:expected) do
        {
          'fatigue' => 10,
          'happienss' => 6,
          'health' => 100,
          'mana' => 20,
          'money' => 100
        }
      end
      it { expect(Actions.new.execute!(status, walk_in_the_park_action)).to eq expected }
    end
  end
  describe '#fetching actions' do
    let(:expected) { ['Go work', 'Walk in the park'] }
    let(:file) { File.read('../valera/configurate.json') }
    let(:app) { JSON.parse(file) }
    context 'from json' do
      it { expect(Actions.new.fetching_actions(app)).to eq expected }
    end
  end
end
