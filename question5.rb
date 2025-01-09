class Animal
  attr_reader :name, :age

  def initialize(name, age)
    raise 'Name cannot be nil!' if name.nil? || name.strip.empty?
    raise 'Age cannot be nil!' if age.nil?
    raise 'Age cannot be string!' if age.is_a?(String)
    raise 'Age cannot be negative!' if age < 0

    @name = name
    @age = age
  end

  def speak
    '...'
  end

  def show_age
    "This animal is #{@age} years old."
  end

  def show_human_age
    "#{calculate_human_years} in human years."
  end

  private

  def calculate_human_years
    @age * 7
  end
end

class Bird < Animal
  def initialize(name, age)
    super
    @legs_count = 2
  end

  def speak
    'Chirp! Chirp!'
  end

  def show_legs
    "This animal has #{@legs_count} legs."
  end
end

class Dog < Animal
  def initialize(name, age)
    super
    @legs_count = 4
  end

  def speak
    'Woof! Woof!'
  end

  def show_legs
    "This animal has #{@legs_count} legs."
  end
end
