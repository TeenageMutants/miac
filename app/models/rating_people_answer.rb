class RatingPeopleAnswer < ActiveRecord::Base
  belongs_to :rating_question
  belongs_to :rating_answer
  belongs_to :organization

  def self.add params
    params[:sum].each do |question, answer|
      rpa=RatingPeopleAnswer.where(rating_question_id: question, rating_answer_id: answer).first
      if rpa.present?
        rpa.increment!(:sum, 1)
      else
        RatingPeopleAnswer.create(organization_id: params[:organization_id], rating_question_id: question, rating_answer_id: answer, sum: 1)
      end
    end
  end
  def self.delete_people_answer params
    RatingPeopleAnswer.find(params[:people_answer_id]).delete
  end

end
