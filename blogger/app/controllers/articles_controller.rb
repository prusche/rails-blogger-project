class ArticlesController < ApplicationController
  include ArticlesHelper #adds article_parms to fix the problems with params; added via private in the other tutorial

  def index #main page with the list of all articles, see index.html.erb
    @articles = Article.all
  end

  def show #page for each individual article, see show.html.erb
    @article = Article.find(params[:id])
  end

  def new #page for creating a new article, see new.html.erb
    @article = Article.new
  end

  def create #method which creates the new article, which then displays it
    @article = Article.new(article_params)
    @article.save

    flash.notice = "Article '#{@article.title}' Created!"

    redirect_to article_path(@article)
  end

  def destroy #deletes article
    @article = Article.find(params[:id])
    @article.delete

    flash.notice = "Article '#{@article.title}' Deleted!"

    redirect_to articles_path
  end

  def edit #displays the page to edit the article, see edit.html.erb
    @article = Article.find(params[:id])
  end

  def update #method to edit the article
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end

end
