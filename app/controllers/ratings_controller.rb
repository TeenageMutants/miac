class RatingsController < ApplicationController
  def add_ambul
    @questions=RatingQuestion.where(rating_form_id: (RatingForm.current_ambul).id)
    if params[:commit].present?
      RatingPeopleAnswer.add params
    end
  end

  def add_hospital
    @questions=RatingQuestion.where(rating_form_id: (RatingForm.current_hospital).id)
    if params[:commit].present?
      RatingPeopleAnswer.add params
      redirect_to thank_you_ratings_path
    end
  end
  def list
  end
  def edit
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
      redirect_to edit_rating_path(params[:id]), notice: "Вопрос удален"
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
      flash[:success] = "Вопрос добавлена"
    end
  end
  def thank_you

  end

  def edit_form
    f = RatingForm.find(params[:id])
    respond_to do |format|
      if f.update_attributes(params)
        format.html { redirect_to list_ratings_path }
        format.json { respond_with_bip(f) }
      # else
      #   format.html { render :action => "women_consultation_edit" }
      #   format.json { respond_with_bip(f) }
      end
    end
  end
end
