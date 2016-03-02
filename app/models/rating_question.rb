class RatingQuestion < ActiveRecord::Base
  belongs_to :rating_form
  has_many :rating_answers, :dependent => :destroy
  has_many :rating_people_answers, :dependent => :destroy
  validates :body, presence: true
  def self.add_question params
    RatingQuestion.create(body: params[:body], rating_form_id: params[:rating_form_id])
  end
  def self.delete_question params
    RatingPeopleAnswer.where(rating_question_id: params[:question_id]).delete_all
    RatingAnswer.where(rating_question_id: params[:question_id]).delete_all
    RatingQuestion.find(params[:question_id]).delete
  end
end
