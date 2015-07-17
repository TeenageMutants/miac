class ArticlesController < ApplicationController
  def index
    @article = Article.new
    # @title = "Новости"

    if current_user.present?
      @articles = Article.order("created_at DESC").publics_to.paginate(:page => params[:page], :per_page => 10)

    else
      @articles = Article.order("created_at DESC").publics_to.publics_at.paginate(:page => params[:page], :per_page => 10)
    end

    if params[:method].present?
      find_art = Article.find(params[:id])
      if params[:method] == 'delete'
        find_art.destroy
        redirect_to articles_path, notice: "Удалено"
      elsif params[:method] == 'unpublic'
        redirect_to articles_path, notice: "Неопубликован"
        find_art.update_attributes(published_at: nil, published_to: nil)
      elsif params[:method] == 'public'
        find_art.update_attributes(published_at: Time.now, published_to: Time.now + 3.year)
        redirect_to articles_path, notice: "Опубликован на стандартный срок"
      end
    end
  end
  def create
    # todo = Article.create(todo_item: params[:todo][:todo_item])
    # (params[:article][:image].present? ? params[:article][:image] : nil)
    art = Article.create(image:(params[:article][:image].present? ? params[:article][:image] : nil), title: params[:article][:title], types: params[:article][:types], preview:params[:article][:preview], body: params[:article][:body], vid_url: (params[:article][:vid_url] unless params[:article][:vid_url].blank?), published_at: params[:article][:published_at].blank? ?  Time.now : params[:article][:published_at], published_to: params[:article][:published_to].blank? ? Time.now + 3.year : params[:article][:published_to], user_id: current_user.id, tag: params[:article][:tag])
    redirect_to :action => 'index'
    Article.add_article(params, curret_user)
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

  def full_page
    @article = Article.find(params[:id])
  end
end
