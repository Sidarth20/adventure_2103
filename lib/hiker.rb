class Hiker
  attr_reader :name, :experience_level, :snacks, :parks_visited

  def initialize(name, experience_level)
    @name = name
    @experience_level = experience_level
    @snacks = {}
    @parks_visited = []
  end

  def pack(item, quantity)
    if @snacks[item].nil?
      @snacks[item] = quantity
    else
      @snacks[item] += quantity
    end
  end

  def visit(park)
    @parks_visited << park
  end

  def possible_trails
    @parks_visited.flat_map do |park|
      park.trails.find_all do |trail|
        trail.level == :moderate
      end
    end
  end

  def favorite_snack
    favorite = @snacks.max_by do |snack, quantity|
      quantity
    end
    favorite.first
  end
end
