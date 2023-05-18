require './lib/room'
require './lib/house'

RSpec.describe House do
  describe "Iteration 2" do
    it 'is an instance of House' do
      house = House.new("$400000", "123 sugar lane")

      expect(house).to be_an_instance_of(House)
    end

    it 'has a price' do
      house = House.new("$400000", "123 sugar lane")
      
      expect(house.price).to eq(400000)
    end

    it 'has an address' do
      house = House.new("$400000", "123 sugar lane")

      expect(house.address).to eq("123 sugar lane")
    end

    it 'has no rooms to start' do
      house = House.new("$400000", "123 sugar lane")

      expect(house.rooms).to eq([])
    end

    it 'can add rooms' do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')

      house.add_room(room_1)
      house.add_room(room_2)
      expect(house.rooms).to eq([room_1, room_2])
    end
  end

  describe "Iteration 3" do
    it 'determines if above market average' do
      house_1 = House.new("$400000", "123 sugar lane")
      house_2 = House.new("$550000", "125 sugar lane")

      expect(house_1.above_market_average?).to eq(false)
      expect(house_2.above_market_average?).to eq(true)
    end

    it 'lists rooms by category' do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')
      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)

      expect(house.rooms_from_category(:bedroom)).to eq([room_1, room_2])
      expect(house.rooms_from_category(:living_room)).to eq([room_3])
      expect(house.rooms_from_category(:basement)).to eq([room_4])
    end

    it 'calculates area of house' do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')
      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)

      expect(house.area).to eq(1900)
    end

    it 'provides house details' do
      house = House.new("$400000", "123 sugar lane")

      expect(house.details).to eq({"price" => 400000, "address" => "123 sugar lane"})
    end
  end

  describe "Iteration 4" do
    it 'calculates prices per sq ft' do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')
      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)

      expect(house.area).to eq(1900)
      expect(house.prices_per_sq_ft).to eq(210.53)
    end

    it 'can sort rooms by area' do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')
      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)

      expect(house.sort_rooms_by_area).to eq([room_4, room_3, room_2, room_1])
    end

    it 'returns rooms by category' do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')
      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)

      expect(house.rooms_by_category).to eq({:bedroom => [room_1, room_2], :living_room => [room_3], :basement => [room_4]})
    end
  end
end