class Trail
  attr_reader :name, :length, :level

  def initialize(attributes)
    @name = attributes[:name]
    @length = attributes[:length].delete(' miles').to_f
    @level = attributes[:level]
  end
end
