class User < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true }

  def self.hello_world
    'Hello, World!!'
  end

  def say_hello
    'Hello!!'
  end
end
