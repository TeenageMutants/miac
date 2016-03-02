class CreateRatingQuestions < ActiveRecord::Migration
  def change
    create_table :rating_questions do |t|
      t.text :body
      t.belongs_to :rating_form, index: true
    end
  end
end
