# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.create!(
name: "Yoshi",
age: 100,
birth_date: Date.parse('01-01-1999'),
color: 'black & yellow',
sex: 'M'
)

Cat.create!(
name: "Waffles",
age: 2,
birth_date: Date.parse('11-11-2011'),
color: 'syrupy',
sex: 'F'
)

CatRentalRequest.create!(
cat_id: 1,
start_date: Date.parse('10-10-2014'),
end_date: Date.parse('20-10-2014'),
status: 'APPROVED'
)

CatRentalRequest.create!(
cat_id: 1,
start_date: Date.parse('30-10-2014'),
end_date: Date.parse('10-11-2014'),
status: 'APPROVED'
)

CatRentalRequest.create!(
cat_id: 2,
start_date: Date.parse('20-09-2014'),
end_date: Date.parse('01-10-2014'),
status:'PENDING'
)
#
# CatRentalRequest.create!(
# cat_id: 1,
# start_date: Date.parse('30-10-2014'),
# end_date: Date.parse('10-11-2014'),
# status: 'APPROVED'
# )
