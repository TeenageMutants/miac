class ArticlesController < ApplicationController
  def index
    @article = Article.new
    # @title = "Новости"
    @articles = Article.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    if params[:info] == 'delete'
      Article.find(params[:id]).destroy
      redirect_to articles_path, notice: "Удалено"

    end
  end
  def create
    # todo = Article.create(todo_item: params[:todo][:todo_item])
    # (params[:article][:image].present? ? params[:article][:image] : nil)
    art = Article.create(title: params[:article][:title], types: params[:article][:types], preview:params[:article][:preview], body: params[:article][:body], vid_url: (params[:article][:vid_url] unless params[:article][:vid_url].blank?), published_at: Time.now, published_to: Time.now, user_id: current_user.id)
    redirect_to :action => 'index'
    flash[:alert] = art.errors.full_messages.join(", ")
  end
  def new
    @title = "Добавление новости"
    @article = Article.new
  end
  def show
    @article = Article.find(params[:id])

    @title = @article.title
  end

  def edit
    @article = Article.find(params[:id])
    if params[:commit].present?
      @article.update_attributes(image: (params[:article][:image].present? ? params[:article][:image] : @article.image ),title: params[:article][:title], types: params[:article][:types], preview:params[:article][:preview], body: params[:article][:body], vid_url: (params[:article][:vid_url] unless params[:article][:vid_url].blank?), published_at: Time.now, published_to: Time.now, user_id: current_user.id)
      flash[:alert] = @article.errors.full_messages.join(", ")
      redirect_to articles_path, notice: "Запись успешно обновлена"
    end
  end

  def news
    @title = "Новости"
    @articles = Article.order("created_at DESC").types_0.paginate(:page => params[:page], :per_page => 10)
  end
end
