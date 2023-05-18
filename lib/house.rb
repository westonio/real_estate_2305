 class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price.delete("$").to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price > 500000
  end

  def rooms_from_category(category)
    @rooms.select do |room|
      room.category == category
    end
  end

  def area
    total_area = 0
    @rooms.each do |room|
      total_area += room.area
    end
    total_area
  end

  def details
    {"price" => @price, "address" => @address}
  end

  def price_per_square_foot
    price_sqft = @price / area.to_f
    price_sqft.round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort do |room| 
      room.area
    end
  end

  def rooms_by_category
    {bedroom: rooms_from_category(:bedroom),
    living_room: rooms_from_category(:living_room),
    basement: rooms_from_category(:basement)}
  end
 end