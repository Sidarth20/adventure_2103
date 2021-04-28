class Park
  attr_reader :name, :trails

  def initialize(name)
    @name = name
    @trails = []
  end

  def add_trail(trail)
    @trails << trail
  end

  def trails_shorter_than(mileage)
    @trails.find_all do |trail|
      trail.length < mileage
    end
  end

  def hikeable_miles
    @trails.sum do |trail|
      trail.length
    end
  end

  def trails_by_level
    hash = {}
    @trails.each do |trail|
      if hash[trail.level].nil?
        if trail.level == :easy
          hash[trail.level] = [trail.name]
        elsif trail.level == :moderate
          hash[trail.level] = [trail.name]
        elsif trail.level == :strenuous
          hash[trail.level] = [trail.name]
        end
      else
        hash[trail.level] += [trail.name]
      end
    end
    hash
  end
end
