class Dose < ActiveHash::Base
  self.data = [
    {id: 1, name: '---'},
    {id: 2, name: '1T'},
    {id: 3, name: '1/2T'},
    {id: 4, name: '1/4T'}
  ]
  include ActiveHash::Associations
  has_many :madecines
end
