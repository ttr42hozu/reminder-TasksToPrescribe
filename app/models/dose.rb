class Dose < ActiveHash::Base
  self.data = [
    {id: 1, name: '---'},
    {id: 1, name: '1T'},
    {id: 1, name: '1/2T'},
    {id: 1, name: '1/4T'}
  ]
end
