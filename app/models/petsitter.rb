class Petsitter
  include Mongoid::Document
  field :name, :type => String

  embedded_in :person, :inverse_of => :petsitter
end
