class Company
  include Mongoid::Document
  field :name, :type => String
  field :founded, :type => Date

  embeds_one :photo
end
