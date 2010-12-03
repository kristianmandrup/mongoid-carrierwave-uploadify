class Pet
  include Mongoid::Document
  field :name, :type => String
  field :kind, :type => String

  embedded_in :person, :inverse_of => :pets
end
