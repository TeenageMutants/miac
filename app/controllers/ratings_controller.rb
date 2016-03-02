class RatingsController < ApplicationController

  respond_to :html, :json

  def add_ambul
    @questions=RatingQuestion.where(rating_form_id: (RatingForm.current_ambul).id).order(:id)
    if params[:commit].present?
      RatingPeopleAnswer.add params
    end
  end

  def add_hospital
    @questions=RatingQuestion.where(rating_form_id: (RatingForm.current_hospital).id).order(:id)
    if params[:commit].present?
      RatingPeopleAnswer.add params
      redirect_to thank_you_ratings_path
    end
  end
  def list
    redirect_to ratings_path, notice: "Недостаточно прав" unless user_signed_in?

  end
  def edit
    redirect_to ratings_path, notice: "Недостаточно прав" unless user_signed_in?
    if params[:delete_form].present?
      RatingForm.delete_form params
      redirect_to list_ratings_path, notice: "Анкета удалена"
    end
    if params[:set_current].present?
      RatingForm.set_current params
      redirect_to edit_rating_path(params[:id]), notice: "Анкета назначена текущей"
    end
    if params[:delete_question].present?
      RatingQuestion.delete_question params
      redirect_to edit_rating_path(params[:id]), notice: "Вопрос удален"
    end
    if params[:delete_answer].present?
      RatingAnswer.delete_answer params
      redirect_to edit_rating_path(params[:id]), notice: "Ответ удален"
    end

  end
  def index

  end
  def add_form
    # params[:name]='адын'
    rating_form=RatingForm.add_form params
    if rating_form.errors.present?
      redirect_to list_ratings_path
      rating_form.errors.each_with_index do |msg,i|
        # flash[:alert] =msg[1]
        flash[:alert] =msg[1]
      end
    else
      redirect_to edit_rating_path(RatingForm.last.id)
      flash[:success] = "Анкета добавлена"
    end
  end
  def add_question
    answers=[]
    answers=params[:answers].split('/').reject { |a| a.blank? }
    rating_question=RatingQuestion.add_question params
    if rating_question.errors.present?
      redirect_to edit_rating_path(params[:rating_form_id])
      rating_question.errors.each_with_index do |msg,i|
        flash[:danger]=msg[1]
      end
    else
      q_id=RatingQuestion.last.id
      answers.each { |a| RatingAnswer.add_answer(a, q_id)}
      redirect_to edit_rating_path(params[:rating_form_id])
      flash[:success] = "Вопрос добавлен"
    end
  end
  def thank_you

  end


  def edit_form
    f = RatingForm.find(params[:id])
    respond_to do |format|
      if f.update_attributes(form_params)
        format.html { redirect_to list_ratings_path }
        format.json { respond_with_bip(f) }
      end
    end
  end
  def edit_question
    q = RatingQuestion.find(params[:id])
    respond_to do |format|
      if q.update_attributes(question_params)
        format.html { redirect_to list_ratings_path }
        format.json { respond_with_bip(q) }
      end
    end
  end
  def edit_answer
    a = RatingAnswer.find(params[:id])
    respond_to do |format|
      if a.update_attributes(answer_params)
        format.html { redirect_to list_ratings_path }
        format.json { respond_with_bip(a) }
      end
    end
  end
  private
  def form_params
    params.require(:rating_form).permit!
  end
  def question_params
    params.require(:rating_question).permit!
  end
  def answer_params
    params.require(:rating_answer).permit!
  end
end

