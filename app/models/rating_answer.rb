class RatingAnswer < ActiveRecord::Base
  belongs_to :rating_question
  has_many :rating_people_answers, :dependent => :destroy
  validates :body, presence: true

  def self.add_answer body, question_id
    RatingAnswer.create(body: body, rating_question_id: question_id)
  end
  def self.delete_answer params
    RatingPeopleAnswer.where(rating_answer_id: params[:answer_id]).delete_all
    RatingAnswer.find(params[:answer_id]).delete
  end

end
