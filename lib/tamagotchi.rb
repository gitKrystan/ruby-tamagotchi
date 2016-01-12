class Tamagotchi
  define_method(:initialize) do |name|
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
  end

  define_method(:name) do
    @name
  end

  define_method(:food_level) do
    @food_level
  end

  define_method(:sleep_level) do
    @sleep_level
  end

  define_method(:activity_level) do
    @activity_level
  end

  define_method(:is_alive?) do
    (@food_level > 0) &&
      (@sleep_level > 0) &&
      (@activity_level > 0)
  end

  define_method(:set_food_level) do |new_level|
    @food_level = new_level
  end

  define_method(:set_sleep_level) do |new_level|
    @sleep_level = new_level
  end

  define_method(:set_activity_level) do |new_level|
    @activity_level = new_level
  end

  define_method(:time_passes) do
    @food_level -= 1
    @sleep_level -= 1
    @activity_level -= 1
  end

  define_method(:feed) do |amount|
    @food_level += amount

    if @food_level > 10
      @food_level = 10
    end
  end

  define_method(:nap) do |amount|
    @sleep_level += amount

    if @sleep_level > 10
      @sleep_level = 10
    end
  end

  define_method(:play) do |amount|
    @activity_level += amount

    if @activity_level > 10
      @activity_level = 10
    end
  end
end
