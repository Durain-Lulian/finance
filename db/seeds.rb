# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create()
puts user.errors.full_messages
insurance_provider = Provider.create()
investment_provider = Provider.create()

insurance = Insurance.create(provider: insurance_provider)
investment = Investment.create(provider: investment_provider)
puts investment.errors.full_messages


user_insurances = UserInsurance.create(insurance: insurance, user: user)
user_investments = UserInvestment.create(investment:investment, user: user)

Log.create(loggable: user_investments)
Log.create(loggable: user_insurances)
