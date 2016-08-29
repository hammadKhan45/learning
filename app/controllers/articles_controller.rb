class ArticlesController < ApplicationController
  before_action :set_param_white, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.all
  end



  def new
    @article = Article.new

  end
  def create
    debugger
    @article =Article.new(article_params)
    @article.user = User.first
    if @article.save
     flash[:success] = "Article was successfully creeated"
     redirect_to article_path(@article)

   else
     render "new"
   end
  end

  def edit

  end
  def update


    if @article.update(article_params)
      flash[:success] = "Article was updates successfully"
      redirect_to article_path(@article)

    else
      render "edit"



    end
  end


def show


end

  def destroy

    @article.destroy
  flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end

  private
  def set_param_white
    @article = Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:title, :description)
  end
end