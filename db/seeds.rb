#-------------Seed data for Cats-----------------------------------------

# cats = Cat.create([ { pet_name: 'Minnie Louise',
#                       date_of_birth: '2005-12-01'
#                     },
#                     { pet_name: 'Bianca Maree',
#                       date_of_birth: '2007-11-28'
#                     },
#                     { pet_name: 'Spot',
#                       registered_name: 'Askari Blu Spot Ona White Cloud',
#                       registration_number: '',
#                       date_of_birth: '2000-12-24'
#                     },
#                     {
#                       pet_name: 'Madison',
#                       registered_name: "Askari Dashin Bit O'Stuff",
#                       registration_number: '',
#                       date_of_birth: '2001-10-12',
#                     },
#                     { pet_name: 'Mickey',
#                       registered_name: 'Askari Hairy McKerrie',
#                       registration_number: '',
#                       date_of_birth: '2001-10-10'
#                     },
#                     {
#                       pet_name: "Phoebe Jayne",
#                       registered_name: 'Rosimorn Fancy That',
#                       registration_number: '',
#                       date_of_birth: '2008-12-03'
#                     }
#                   ])


#-------------Seed data for Breeds-----------------------------------------

# breeds = Breed.create([
#                         { breed_name: "Domestic Shorthair"},
#                         { breed_name: "Exotic Shorthair" },
#                         { breed_name: "Oriental Cross" },
#                         { breed_name: "Persian" }
#                       ])


#-------------Seed data to assign Breeds to Cats-----------------------------------------

minnie = Cat.find_by_pet_name("Minnie Louise")
minnie.breed = Breed.find_by_breed_name("Domestic Shorthair")
minnie.save

bianca = Cat.find_by_pet_name("Bianca Maree")
bianca.breed = Breed.find_by_breed_name("Oriental Cross")
bianca.save

spot = Cat.find_by_pet_name("Spot")
spot.breed = Breed.find_by_breed_name("Persian")
spot.save

madison = Cat.find_by_pet_name("Madison")
madison.breed = Breed.find_by_breed_name("Exotic Shorthair")
madison.save

mickey = Cat.find_by_pet_name("Mickey")
mickey.breed = Breed.find_by_breed_name("Persian")
mickey.save

phoebe = Cat.find_by_pet_name("Phoebe Jayne")
phoebe.breed = Breed.find_by_breed_name("Exotic Shorthair")
phoebe.save