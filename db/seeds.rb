admin = User.create(user_name: 'test' ,email: 'test@test.test', password: 'test', password_confirmation: 'test')
admin.toggle!(:admin)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
