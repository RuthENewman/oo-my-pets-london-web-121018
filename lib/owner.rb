class Owner
  # code goes here
  @@all = []
  @@count = 0

  attr_accessor :name, :pets, :fishes, :dogs, :cats
  attr_reader :species

  def initialize(species, pets = {:fishes => [], :dogs => [], :cats => []})
    @species = species
    @@all << self
    @@count += 1
    @pets = pets
  end

  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@count = 0
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(fish)
    @pets[:fishes] << Fish.new(fish)
  end

  def buy_cat(cat)
    @pets[:cats] << Cat.new(cat)
  end

  def buy_dog(dog)
    @pets[:dogs] << Dog.new(dog)
  end

  def walk_dogs
   @pets[:dogs].each {|dog| dog.mood = 'happy'}
  end

  def play_with_cats
    @pets[:cats].each {|cat| cat.mood = 'happy'}
  end

  def feed_fish
    @pets[:fishes].each {|fish| fish.mood = 'happy'}
  end

  def sell_pets
    @pets.each do |type, list_of_pets|
      list_of_pets.each do |pet|
        pet.mood = 'nervous'
      end
    end
    @pets.clear
  end

  def list_pets
    "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end

end
