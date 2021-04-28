require './lib/trail'
require 'rspec'

RSpec.describe Trail do
  it 'exists and has attributes' do
    trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})

    expect(trail1).to be_a(Trail)
    expect(trail1.name).to eq('Grand Wash')
    expect(trail1.length).to eq(2.2)
    expect(trail1.level).to eq(:easy)
  end
end
