class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def has_ability? ability
    user_signed_in? && RoleAbility.where(role_id: current_user.role_id, ability_id: Ability.get_ability_by_name(ability).id).first.is_set
  end

end
