require './lib/actions'

RSpec.describe Actions do
  describe '#fetching_actions' do
    let(:file) { File.read('../valera/configurate.json') }
    let(:configurate) { JSON.parse(file) }
    let(:actions_array) { ['Go work', 'Walk in the park'] }
    it {
      expect(Actions.new.fetching_actions(configurate)).to eq actions_array
    }
  end
  describe '#read_actions' do
    let(:game) { Game.new }
    it {
      allow($stdin).to receive(:gets).and_return('4')
      Actions.new.read_actions(game)
      expect(game.action_item).to eq 4
    }
  end
  describe '#change' do
    let(:game) { Game.new }
    let(:field) { 40 }
    let(:key) do
      {
        'value' => '10',
        'operator' => '-'
      }
    end
    it {
      expect(Actions.new.change(field, key)).to eq 30
    }
  end
  describe '#change_status' do
    let(:action) do
      {
        'fun' => {
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
    end
    let(:status) do
      {
        'health' => 100,
        'mana' => 40,
        'fun' => 0,
        'fatigue' => 0,
        'money' => 0
      }
    end
    let(:new_status) do
      {
        'health' => 100,
        'mana' => 30,
        'fun' => 1,
        'fatigue' => 10,
        'money' => 0
      }
    end

    it {
      expect(Actions.new.change_status(status, action)).to eq new_status
    }
  end
  describe '#check_conds' do
    let(:action) do
      {

      }
    end
    let(:status) do
      {
        'health' => 100,
        'mana' => 40,
        'fun' => 0,
        'fatigue' => 0,
        'money' => 0
      }
    end

    it {
      expect(Actions.new.check_conds(status, action)).to eq true
    }
  end
  describe '#select_action' do
    let(:action) do
      {
        'conds' => {},
        'effects' => {
          'fun' => {
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
    let(:status) do
      {
        'health' => 100,
        'mana' => 40,
        'fun' => 0,
        'fatigue' => 0,
        'money' => 0
      }
    end
    let(:new_status) do
      {
        'health' => 100,
        'mana' => 30,
        'fun' => 1,
        'fatigue' => 10,
        'money' => 0
      }
    end

    it {
      expect(Actions.new.select_action(status, action)).to eq new_status
    }
  end
  describe '#execute!' do
    let(:status) do
      {
        'health' => 100,
        'mana' => 30,
        'fun' => 5,
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
            'fun' => {
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
          'fun' => 0,
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
            'fun' => {
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
          'fun' => 6,
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
