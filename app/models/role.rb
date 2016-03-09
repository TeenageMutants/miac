class Role < ActiveRecord::Base

  # При добавлении новой роли все права доступа по умолчанию для нее установлены в false,
  # но можно задать те права, на которые роль будет иметь права
  # При добавлении какой-либо новой роли рекомендуется прописывать ее в db:seed

  def self.add_role name, description, abilities={}
    new_role=Role.create(name: name, description: description)
    Ability.all.each do |ability|
      if abilities[ability.name.to_sym].present?
        RoleAbility.create(role_id: new_role.id, ability_id: ability.id, is_set: abilities[ability.name.to_sym])
      else
        RoleAbility.create(role_id: new_role.id, ability_id: ability.id, is_set: false)
      end
    end
    new_role
  end
end
