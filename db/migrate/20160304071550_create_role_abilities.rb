class CreateRoleAbilities < ActiveRecord::Migration
  def change
    create_table(:roles) do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
    change_table :users do |t|
      t.belongs_to :role
    end
    create_table :role_abilities do |t|
      t.belongs_to :role
      t.belongs_to :ability
      t.boolean :is_set
    end

    create_table :abilities do |t|
      t.string :name
      t.text :description
    end
    # create_table(:users_roles, :id => false) do |t|
    #   t.references :user
    #   t.references :role
    # end

    # add_index(:roles, :name)
    # add_index(:users_roles, [ :user_id, :role_id ])
    # add_column :users, :role_id, :integer, default: 4
    # add_column :users, :role_id, :integer
  end
end
