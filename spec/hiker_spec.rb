require './lib/trail'
require './lib/park'
require './lib/hiker'
require 'rspec'

RSpec.describe Hiker do
  it 'exists and has attributes' do
    hiker = Hiker.new('Dora', :moderate)

    expect(hiker).to be_a(Hiker)
    expect(hiker.name).to eq('Dora')
    expect(hiker.experience_level).to eq(:moderate)
    expect(hiker.snacks).to eq({})
  end

  it 'has snacks' do
    hiker = Hiker.new('Dora', :moderate)
    hiker.pack('water', 1)
    hiker.pack('trail mix', 3)

    expect(hiker.snacks).to eq({'water' => 1, 'trail mix' => 3})

    hiker.pack('water', 1)

    expect(hiker.snacks).to eq({'water' => 2, 'trail mix' => 3})
  end

  it 'has no parks visited' do
    hiker = Hiker.new('Dora', :moderate)
    park1 = Park.new('Capitol Reef')
    park2 = Park.new('Bryce Canyon')

    expect(hiker.parks_visited).to eq([])
  end

  it 'visits parks' do
    hiker = Hiker.new('Dora', :moderate)
    park1 = Park.new('Capitol Reef')
    park2 = Park.new('Bryce Canyon')
    hiker.visit(park1)
    hiker.visit(park2)

    expect(hiker.parks_visited).to eq([park1, park2])
  end
end
