class Room
  attr_reader :category, :length, :width

  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width.to_i
    @paint = false
  end

  def area
    @length * @width
  end

  def painted?
    @paint
  end

  def paint
    @paint = true
  end
end
