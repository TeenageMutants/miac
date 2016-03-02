class CreateRatingForms < ActiveRecord::Migration
  def change
    create_table :rating_forms do |t|
      t.string :name
      t.integer :type_id
      t.boolean :is_current
      t.timestamps
    end
  end
end
