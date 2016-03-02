class CreateEvents < ActiveRecord::Migration
  using(:shard_one)
  def change
    create_table :events do |t|
      t.datetime :starts_at
      t.datetime :ends_at
      t.boolean :all_day
      t.belongs_to :todolist
      t.string :color
      t.timestamps
    end
  end

end
