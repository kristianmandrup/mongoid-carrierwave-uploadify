class Person
  include Mongoid::Document
  field :name, :type => String
  field :age, :type => Integer

  embeds_many :pets
  embeds_one :petsitter

end
