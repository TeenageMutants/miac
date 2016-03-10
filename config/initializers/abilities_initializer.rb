


#
abilities={}
abilities[:calendar]= Ability.where(name: "calendar").present? ? Ability.where(name: "calendar").first : Ability.add_ability("calendar", "Добавление записей в календарь")
abilities[:rating]=Ability.where(name: "rating").present? ? Ability.where(name: "rating").first : Ability.add_ability("rating", "Редактирование анкет рейтинга")
abilities[:news]=Ability.where(name: "news").present? ? Ability.where(name: "news").first : Ability.add_ability("news", "Добавление новостей")
abilities[:users]= Ability.where(name: "users").present? ? Ability.where(name: "users").first : Ability.add_ability("users", "Управление пользователями")
abilities[:phone_book]=Ability.where(name: "phone_book").present? ? Ability.where(name: "phone_book").first : Ability.add_ability("phone_book", "Изменение телефонной книги")

role_abilities={}
role_abilities[:admin]={calendar: true, rating: true, news: true, users: true, phone_book: true}
role_abilities[:doctor]={calendar: true, rating: false, news: false, users: false, phone_book: false}
role_abilities[:minzdrav]={calendar: true, rating: true, news: false, users: false, phone_book: false}

roles={}
roles[:admin]= Role.where(name:"admin").present? ? Role.where(name:"admin").first : Role.add_role("admin","Администратор", role_abilities[:admin])
roles[:doctor]= Role.where(name:"doctor").present? ? Role.where(name:"doctor").first : Role.add_role("doctor", "Врач", role_abilities[:doctor])
roles[:minzdrav]= Role.where(name:"minzdrav").present? ? Role.where(name:"minzdrav").first : Role.add_role("minzdrav", "Представитель Минздрава", role_abilities[:minzdrav])
