# coding: utf-8
class UserAbility
  include CanCan::Ability
  def initialize(user)
    user ||= User.new # guest user
    if user.role? :Администратор
      can :manage, :all
    elsif user.role? :Модератор
      can :manage, Article do |article|
        article.try(:owner) == user
      end
    else
      can :read, :all
    end
  end
end