# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(username: 'admin',fio: "Администратор", password: '!ELD1Wine!', email: 'admin@miac.kaluga.ru', admin: true, moderator: false)
moderator = User.create(username: 'moderator',fio: "Модератор новостей", password: '!ELD1Wine!', email: 'test@test.ru', moderator: true, admin: false)
me = User.create(username: 'seleznev',fio: "Селезнев Михаил Михайлович", password: 'XAfb32Mt', email: 'seleznev@miac.kaluga.ru', admin: true, moderator: false)
