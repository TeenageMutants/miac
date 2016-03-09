module ApplicationHelper
  def has_ability? ability
    user_signed_in? && RoleAbility.where(role_id: current_user.role_id, ability_id: Ability.get_ability_by_name(ability).id).first.is_set
  end
end
