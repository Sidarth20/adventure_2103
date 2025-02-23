require './lib/trail'
require './lib/park'
require './lib/hiker'
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

  it 'has shorter trails than given mileage' do
    trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
    trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
    trail3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})
    trail4 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
    trail5 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
    trail6 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})
    park1 = Park.new('Capitol Reef')
    park2 = Park.new('Bryce Canyon')
    park1.add_trail(trail1)
    park1.add_trail(trail2)
    park1.add_trail(trail3)
    park2.add_trail(trail4)
    park2.add_trail(trail5)
    park2.add_trail(trail6)
    hiker = Hiker.new('Dora', :moderate)
    hiker.visit(park1)
    hiker.visit(park2)

    expect(park1.trails_shorter_than(2.5)).to eq([trail1, trail2])
    expect(park2.trails_shorter_than(2.5)).to eq([])
  end

  it 'has hikeable miles' do
    trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
    trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
    trail3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})
    trail4 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
    trail5 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
    trail6 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})
    park1 = Park.new('Capitol Reef')
    park2 = Park.new('Bryce Canyon')
    park1.add_trail(trail1)
    park1.add_trail(trail2)
    park1.add_trail(trail3)
    park2.add_trail(trail4)
    park2.add_trail(trail5)
    park2.add_trail(trail6)
    hiker = Hiker.new('Dora', :moderate)
    hiker.visit(park1)
    hiker.visit(park2)

    expect(park1.hikeable_miles).to eq(7.5)
    expect(park2.hikeable_miles).to eq(16.9)
  end

  it 'has trails by level' do
    trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
    trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
    trail3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})
    trail4 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
    trail5 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
    trail6 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})
    park1 = Park.new('Capitol Reef')
    park2 = Park.new('Bryce Canyon')
    hiker = Hiker.new('Dora', :moderate)
    park1.add_trail(trail1)
    park1.add_trail(trail2)
    park1.add_trail(trail3)
    park2.add_trail(trail4)
    park2.add_trail(trail5)
    park2.add_trail(trail6)

    expected1 = {
                 :easy => ["Grand Wash"],
                 :moderate => ["Cohab Canyon"],
                 :strenuous => ["Chimney Rock Loop"]
                }
    expect(park1.trails_by_level).to eq(expected1)

    expected2 = {
                 :moderate => ["Queen's/Navajo Loop", 'Tower Bridge'],
                 :easy => ['Rim Trail'],
                }
    expect(park2.trails_by_level).to eq(expected2)
  end

  it 'has a visitors log' do
    trail1 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
    trail2 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
    trail3 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})
    trail4 = Trail.new({name: 'Peekaboo Loop', length: '5.5 miles', level: :strenuous})
    park = Park.new('Bryce Canyon')
    park.add_trail(trail1)
    park.add_trail(trail2)
    park.add_trail(trail3)
    park.add_trail(trail4)
    hiker1 = Hiker.new('Dora', :moderate)
    hiker2 = Hiker.new('Frank', :easy)
    hiker3 = Hiker.new('Jack', :strenuous)
    hiker4 = Hiker.new('Sally', :strenuous)
    hiker1.visit(park)
    hiker2.visit(park)
    hiker3.visit(park)
    hiker4.visit(park)
    hiker1.visit(park)
    hiker2.visit(park)
    hiker3.visit(park)
    hiker4.visit(park)

    expect(park.visitors_log).to eq({1980 => {"06/24" => {
                                             hiker2 => trail1,
                                             hiker3 => trail4
                                             }
                                    }})
  end
end
