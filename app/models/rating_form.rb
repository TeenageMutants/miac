class RatingForm < ActiveRecord::Base
  has_many :rating_questions, :dependent => :destroy
  validates :name, presence: true
  validates :type_id, presence: true


  def self.current_ambul
    RatingForm.where(is_current: true, type_id: 1).first
  end
  def self.current_hospital
    RatingForm.where(is_current: true, type_id: 2).first
  end
  def self.add_form params
    RatingForm.create(is_current: false, type_id: params[:type_id], name: params[:name])
  end
  def self.set_current params
    type_id=RatingForm.find(params[:id]).type_id
    (RatingForm.where(type_id: type_id)).update_all(is_current: false)
    RatingForm.find(params[:id]).update(is_current: true)
  end
  def self.delete_form params
    q=RatingQuestion.where(rating_form_id: params[:form_id])
    a=RatingAnswer.where(rating_question_id: q)
    pa=RatingPeopleAnswer.where(rating_question_id: q)
    pa.delete_all
    a.delete_all
    q.delete_all
    RatingForm.find(params[:form_id]).delete
  end

end
