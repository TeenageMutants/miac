class CreateTodolists < ActiveRecord::Migration
  using(:shard_one)
  def change
    create_table :todolists do |t|
      t.string :title, null: false
      t.text :description
      t.boolean :private, default: false

      t.integer :performer_id, null: false

      t.belongs_to :user, index: true, null: false

      t.timestamps
    end

  end

end