class Company
  include Mongoid::Document
  field :name, :type => String
  field :founded, :type => Date

  embeds_one :photo,  :stored_as => :array

  accepts_nested_attributes_for :photo
end
