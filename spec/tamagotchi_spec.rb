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
end
