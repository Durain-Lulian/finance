# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# user = User.create()
# # puts user.errors.full_messages
# insurance_provider = Provider.create()
# investment_provider = Provider.create()

# insurance = Insurance.create(provider: insurance_provider)
# puts insurance.errors.full_messages

# investment = Investment.create(provider: investment_provider)
# puts investment.errors.full_messages


# user_insurances = UserInsurance.create(insurance: insurance, user: user, value: 10)
# user_investments = UserInvestment.create(investment:investment, user: user, value: 0)

# Log.create(loggable: user_investments)
# Log.create(loggable: user_insurances)
require 'csv'

Log.delete_all
Receipt.delete_all
UserInsurance.delete_all
UserInvestment.delete_all
Insurance.delete_all
Investment.delete_all
Provider.delete_all
User.delete_all

csv_text = File.read(Rails.root.join('db/seeds', 'providers.csv'))
csv = CSV.parse(csv_text, headers: true, :quote_char => '"', encoding: 'UTF-8')
csv.each do |row|
    provider = Provider.new()
    provider.name = row['provider_name']
    provider.description = row['description']
    provider.image = row['image']
    # provider.provider_id = row['provider_id']
    provider.save
end

csv_text = File.read(Rails.root.join('db/seeds', 'investments.csv'))
csv = CSV.parse(csv_text, headers: true, :quote_char => '"', encoding: 'UTF-8')
csv.each do |row|
    fund = Investment.new()
    fund.name = row['name']
    fund.provider = Provider.find_by(name: row['provider_name'])
    fund.description = row['description']
    fund.value_per_unit = row['value_per_unit']
    fund.ticker = row['ticker']
    fund.save
end

csv_text = File.read(Rails.root.join('db/seeds', 'insurances.csv'))
csv = CSV.parse(csv_text, headers: true, :quote_char => '"', encoding: 'UTF-8')
csv.each do |row|
    fund = Insurance.new()
    fund.name = row['insurance_name']
    fund.provider = Provider.find_by(name: row['provider_name'])
    fund.plan = row['plan']
    fund.save
end


# puts "There are now #{Seller.count} rows in the seller table"
