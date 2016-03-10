class Ability< ActiveRecord::Base
  def self.get_ability_by_name name
    Ability.where(name: name).first
  end
  # При добавлении нового права доступа по умолчанию для всех ролей оно остановлено в false,
  # но можно задать тех пользователей, которые будут иметь это право
  # При добавлении какого-либо нового права рекомендуется прописывать его в db:seed

  # ИСПОЛЬЗОВАНИЕ has_ability?(:rating)

  def self.add_ability name, description#, roles_who_have=[]
    new_ability=Ability.create(name: name, description: description)
    # Role.all.each do |role|
    #   if roles_who_have.include?(role.name.to_sym)
    #     RoleAbility.create(role_id: role.id, ability_id: new_ability.id, is_set: true)
    #   else
    #     RoleAbility.create(role_id: role.id, ability_id: new_ability.id, is_set: false)
    #   end
    # end
    new_ability
  end
end
