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
        hash[trail.level] = [trail.name]
      else
        hash[trail.level] += [trail.name]
      end
    end
    hash
  end

  def visitors_log
    hash = {}
    #need to bring in parks visited_parks
    # build outer hash of years
    # build interior hash of keys as dates & values as hikers
    # build hiker.values as array
    # @parks_visited
    # require 'pry'; binding.pry
  end
end
