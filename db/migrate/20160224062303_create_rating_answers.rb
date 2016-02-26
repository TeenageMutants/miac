class CreateRatingAnswers < ActiveRecord::Migration
  def change
    create_table :rating_answers do |t|
      t.text :body
      t.belongs_to :rating_question, index: true
    end
  end
end
