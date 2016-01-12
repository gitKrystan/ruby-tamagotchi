require('rspec')
require('tamagotchi')

describe(Tamagotchi) do
  describe('#initialize') do
    it('sets name and life levels of a new tamagotchi') do
      my_pet = Tamagotchi.new('Jon Hamm')
      expect(my_pet.name()).to(eq('Jon Hamm'))
      expect(my_pet.food_level()).to(eq(10))
      expect(my_pet.sleep_level()).to(eq(10))
      expect(my_pet.activity_level()).to(eq(10))
    end
  end

  describe("#is_alive") do
    it("is alive if all levels are above 0") do
      my_pet = Tamagotchi.new("Jon Hamm")
      expect(my_pet.is_alive?()).to(eq(true))
    end

    it("is dead if the food level is 0") do
      my_pet = Tamagotchi.new("Jon Hamm")
      my_pet.set_food_level(0)
      expect(my_pet.is_alive?()).to(eq(false))
    end

    it("is dead if the sleep level is 0") do
      my_pet = Tamagotchi.new("Jon Hamm")
      my_pet.set_sleep_level(0)
      expect(my_pet.is_alive?()).to(eq(false))
    end

    it("is dead if the activity level is 0") do
      my_pet = Tamagotchi.new("Jon Hamm")
      my_pet.set_activity_level(0)
      expect(my_pet.is_alive?()).to(eq(false))
    end
  end

  describe('#time_passes') do
    it('decreases the levels the Tamagotchi has left by 1') do
      my_pet = Tamagotchi.new("Jon Hamm")
      my_pet.time_passes()
      expect(my_pet.food_level()).to(eq(9))
      expect(my_pet.sleep_level()).to(eq(9))
      expect(my_pet.activity_level()).to(eq(9))
    end
  end

  describe('#feed') do
    it('adds to the amount of food the Tamagotchi has left by the amount it is fed') do
      my_pet = Tamagotchi.new("Jon Hamm")
      my_pet.set_food_level(9)
      my_pet.feed(1)
      expect(my_pet.food_level()).to(eq(10))
    end

    it('does not cause the amount of food to exceed 10') do
      my_pet = Tamagotchi.new("Jon Hamm")
      my_pet.set_food_level(9)
      my_pet.feed(2)
      expect(my_pet.food_level()).to(eq(10))
    end
  end

  describe('#nap') do
    it('adds to sleep_level by the amount it naps') do
      my_pet = Tamagotchi.new("Jon Hamm")
      my_pet.set_sleep_level(9)
      my_pet.nap(1)
      expect(my_pet.sleep_level()).to(eq(10))
    end

    it('does not cause sleep_level to exceed 10') do
      my_pet = Tamagotchi.new("Jon Hamm")
      my_pet.set_sleep_level(9)
      my_pet.nap(2)
      expect(my_pet.sleep_level()).to(eq(10))
    end
  end
end
