# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create()
insurance_provider = Provider.create()
investmemt_provider = Provider.create()

insurance = Insurance.create(provider: insurance_provider)
puts insurance.errors.full_messages
investment = Investment.create(provider: investmemt_provider)

log = Log.create(loggable: insurance)
puts log.errors.full_messages
Log.create(loggable: investment)
