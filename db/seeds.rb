# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "creating roles..."

roles={}
roles[:admin]= Role.where(name:"admin").present? ? Role.where(name:"admin").first : Role.create(name:"admin", description:"Администратор")
roles[:doctor]= Role.where(name:"doctor").present? ? Role.where(name:"doctor").first : Role.create(name:"doctor", description:"Врач")
roles[:minzdrav]= Role.where(name:"minzdrav").present? ? Role.where(name:"minzdrav").first : Role.create(name:"minzdrav", description:"Представитель Минздрава")


puts "creating users..."
users={}
users[:admin] = User.where(username:"admin").present? ? User.where(username:"admin").first : User.create(username: 'admin',fio: "Администратор", password: '!ELD1Wine!', email: 'admin@gmail.ru', role_id: roles[:admin].id)
users[:doctor] =  User.where(username:"doctor").present? ? User.where(username:"doctor").first : User.create(username: 'doctor',fio: "Врач", password: '123456aA', email: 'doctor@gmail.ru', role_id: roles[:doctor].id)
users[:minzdrav] =  User.where(username:"minzdrav").present? ? User.where(username:"minzdrav").first : User.create(username: 'minzdrav',fio: "Минздрав", password: '123456aA', email: 'mz@gmail.ru', role_id: roles[:minzdrav].id)


puts "creating abilities..."

abilities={}
abilities[:calendar]= Ability.where(name: "calendar").present? ? Ability.where(name: "calendar").first : Ability.create(name: "calendar", description: "Добавление записей в календарь")
abilities[:rating]=Ability.where(name: "rating").present? ? Ability.where(name: "rating").first : Ability.create(name: "rating", description: "Редактирование анкет рейтинга")
abilities[:news]=Ability.where(name: "news").present? ? Ability.where(name: "news").first : Ability.create(name: "news", description: "Добавление новостей")
abilities[:users]= Ability.where(name: "users").present? ? Ability.where(name: "users").first : Ability.create(name: "users", description: "Управление пользователями")
abilities[:phone_book]=Ability.where(name: "phone_book").present? ? Ability.where(name: "phone_book").first : Ability.create(name: "phone_book", description: "Изменение телефонной книги")


puts "set abilities to roles..."

role_abilities={}
role_abilities[:admin]={calendar: true, rating: true, news: true, users: true, phone_book: true}
role_abilities[:doctor]={calendar: true, rating: false, news: false, users: false, phone_book: false}
role_abilities[:minzdrav]={calendar: true, rating: true, news: false, users: false, phone_book: false}

role_abilities.each do |role, role_ability|
  role_ability.each do |ability, is_set|
    ra=RoleAbility.where(role_id: roles[role].id, ability_id: abilities[ability].id).first
    if ra.present?
      ra.update(is_set: is_set)
    else
      RoleAbility.create(role_id: roles[role].id, ability_id: abilities[ability].id, is_set: is_set)
    end
  end
end

puts "done"
# admin = User.create(username: 'admin',fio: "Администратор", password: '!ELD1Wine!', email: 'admin@miac.kaluga.ru', admin: true, moderator: false)
# moderator = User.create(username: 'moderator',fio: "Модератор новостей", password: '!ELD1Wine!', email: 'test@test.ru', moderator: true, admin: false)
# me = User.create(username: 'seleznev',fio: "Селезнев Михаил Михайлович", password: 'XAfb32Mt', email: 'seleznev@miac.kaluga.ru', admin: true, moderator: false)
