class MainController < ApplicationController
  def index
    @articles = Article.publics
  end

end
