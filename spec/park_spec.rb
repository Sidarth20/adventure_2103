require './lib/trail'
require './lib/park'
require 'rspec'

RSpec.describe Park do
  it 'exists and has attributes' do
    trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
    park1 = Park.new('Capitol Reef')

    expect(park1).to be_a(Park)
    expect(park1.name).to eq('Capitol Reef')
    expect(park1.trails).to eq([])
  end

  it 'has trails' do
    trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
    trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
    park1 = Park.new('Capitol Reef')
    park1.add_trail(trail1)
    park1.add_trail(trail2)

    expect(park1.trails).to eq([trail1, trail2])

    trail3 = Trail.new({name: 'Tower Bridge', length: '3.0 miles', level: :moderate})
    park2 = Park.new('Bryce Canyon')
    park2.add_trail(trail3)

    expect(park2.trails).to eq([trail3])
  end
end
