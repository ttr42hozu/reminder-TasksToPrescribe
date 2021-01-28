class Day < ActiveHash::Base
  self.data = [
    {id: 1, name: '---'},
    {id: 2, name: 7 },
    {id: 3, name: 14 },
    {id: 4, name: 28 },
    {id: 5, name: 56 }
  ]
  include ActiveHash::Associations
  has_many :medicines
end
