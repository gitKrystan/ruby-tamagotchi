require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/tamagotchi')

get('/') do
  erb(:index)
end

post('/welcome') do
  @tamagotchi_name = params[:tamagotchi_name]
  Tamagotchi.new(@tamagotchi_name)
  Tamagotchi.resurrection()
  @age = Tamagotchi.age()
  @money = Tamagotchi.money_to_spend()
  erb(:welcome)
end

get('/tamagotchi') do
  @tamagotchi_name = Tamagotchi.name()
  @food_level = Tamagotchi.food_level()
  @sleep_level = Tamagotchi.sleep_level()
  @activity_level = Tamagotchi.activity_level()
  @age = Tamagotchi.age()
  @depreciation = Tamagotchi.depreciation()
  @money = Tamagotchi.money_to_spend()
  erb(:tamagotchi)
end

post('/round') do
  @money = Tamagotchi.money_to_spend()
  feed= params[:feed].to_i()
  nap = params[:nap].to_i()
  play = params[:play].to_i()
  if @money >= (feed + nap + play)
    Tamagotchi.time_passes()
    Tamagotchi.feed(feed)
    Tamagotchi.nap(nap)
    Tamagotchi.play(play)
    redirect ('/tamagotchi')
  else
    erb(:poor)
  end
end
