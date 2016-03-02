class CreateRatingPeopleAnswers < ActiveRecord::Migration
  def change
    create_table :rating_people_answers do |t|
      t.belongs_to :organization, index: true
      t.belongs_to :rating_question, index: true
      t.belongs_to :rating_answer, index: true
      t.integer :sum
    end
  end
end
