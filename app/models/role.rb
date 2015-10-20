# coding: utf-8
class Role < ActiveRecord::Base
  # attr_accessible :id, :description, :name, :created_at, :updated_at
  #has_and_belongs_to_many :users
  has_many :users

  # ROLES = {1 => {name: "Полезная информация"}, 2 => {name: "Инструкции"}, 3 => {name: "Документы"}, 4 => {name: "Файловый архив"}, 5 => {name: "Видеокурсы"}, 6 => {name: "ДЛО"}}
  def RoleOutput
    "#{name}"
  end
end
