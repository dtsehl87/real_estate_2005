class House

  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
    @details = {}
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    if @price.gsub('$', '').to_i >= 500_000
      true
    else
      false
    end
  end

  def rooms_from_category(category)
    @rooms.find_all do |room|
      room.category == category
    end
  end

  def area
    result = 0
    @rooms.each do |room|
      result += room.area
    end
    result
  end

  def details
    @details["price"] = @price.gsub('$', '').to_i
    @details["address"] = @address
    @details
  end

  def price_per_square_foot
    (@price.gsub('$', '').to_f / self.area).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort do |room|
      room.area
    end
  end

end
