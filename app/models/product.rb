class Product
  include Mongoid::Document
  field :name, :type => String
  field :price, :type => Integer
  field :description, :type => String

  embeds_many :photos
  
end
