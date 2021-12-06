require './lib/actions'
require './lib/application'

RSpec.describe Actions do
  describe '#execute!' do
    context 'Go work' do
      status = {
        'health' => 100,
        'mana' => 30,
        'happienss' => 5,
        'fatigue' => 0,
        'money' => 100
      }
      go_work_action = {
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
      expected = { 'fatigue' => 70, 'happienss' => 0, 'health' => 100, 'mana' => 0, 'money' => 200 }
      it { expect(Actions.new.execute!(status, go_work_action)).to eq expected }
    end
    context 'Walk in the park' do
      status = {
        'health' => 100,
        'mana' => 30,
        'happienss' => 5,
        'fatigue' => 0,
        'money' => 100
      }
      walk_in_the_park_action = {
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
      expected = { 'fatigue' => 10, 'happienss' => 6, 'health' => 100, 'mana' => 20, 'money' => 100 }
      it { expect(Actions.new.execute!(status, walk_in_the_park_action)).to eq expected }
    end
  end
  describe 'fetching actions' do
    expected = ['Go work', 'Walk in the park']
    context 'from json' do
      app = Application.new.configurate_open
      it { expect(Actions.new.fetching_actions(app)).to eq expected }
    end
  end
end
