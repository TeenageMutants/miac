class TodolistsController < ApplicationController
  # before_filter :check_author, only: [:destroy, :update, :edit]
  # before_filter :fillParentChildHash, only: [:new, :edit]



  def check_author
    #current_user_test_id for test. In real current_user_test_id = current_user.id
    current_user_test_id = 500
    if Todolist.exists?(params[:id])
      @todolist = Todolist.find(params[:id])
      @starts_at = Event.find_by_todolist_id(params[:id]).starts_at
      @ends_at = Event.find_by_todolist_id(params[:id]).ends_at
      @hash = Todolist.fill_ancestry_for_user(@todolist.user_id)
      if @todolist.user_id != current_user.id
        # flash[:notice] = ""
        redirect_to todolist_path(@todolist), notice: "Редактирование чужой записи невозможно"
      end
    else
      render text: "Item of Calendar is not found", status: 404
    end
  end




  def index
    todolist = Todolist.using(:shard_one)
    if current_user.present?
      @todolists =  todolist.where("private = ? and performer_id = ? or user_id = ?", false, current_user.id, current_user.id)
    end

  end


  def show
    if Todolist.using(:shard_one).exists?(params[:id])
      @todolist = Todolist.using(:shard_one).find(params[:id])

      render 'show'
    else
      render text: "Page not found", status: 404
    end
  end

  def detail_todolist

    if user_signed_in?
      @todolists = Todolist.using(:shard_one).where("(private = ? and user_id = ?) or private=?", true, current_user.id, false)
    else
      @todolists = Todolist.using(:shard_one).where(private: false)
    end



  end



  def new
    @todolist = Todolist.using(:shard_one).new


    @todolist.build_event
    # @todolist.event.build(params[:event])

  end


  def create
    @todolist = Todolist.using(:shard_one).create(todolist_params)

    if @todolist.errors.empty?
      redirect_to events_path
    else
      flash.now[:alert] = "Заполните поля, помеченные звездочкой"
      render 'new'
    end
  end
  #
  def destroy
    @todolist = Todolist.using(:shard_one).find(params[:id]).destroy
    if @todolist.errors.blank?
      redirect_to events_path, notice: "Задание удалено"
    else
      redirect_to events_path, notice:  "Ошибка при удалении задания"
    end
  end


  def edit
    @todolist = Todolist.using(:shard_one).find(params[:id])
  end

  def update
    if params[:commit].present?
      @todolist = Todolist.using(:shard_one).find(params[:id])

      if @todolist.update_attributes(todolist_params)
        redirect_to todolist_path(@todolist), notice: "Задание изменено"
      else
        # fillParentChildHash
        flash.now[:alert] = "Заполните поля, помеченные звездочкой"
        render 'edit'
      end
    end
  end


  private
  def todolist_params
    params.require(:todolist).permit(:title, :description, :user_id, :performer_id, :private,
                                     event_attributes: [:id, :starts_at, :ends_at, :performer_id,
                                                        :all_day, :todolist_id, :color])
  end
  def event_params
    params.require(:event).permit(:starts_at, :ends_at, :performer_id, :all_day, :todolist_id)
  end

end
