class BlogsController < ApplicationController
  def index
    blogs = Blog.all
    # JSON形式で返す
    render json: blogs
  end

  def show
    blog = Blog.find(params[:id])
    render json: blog
  end

  def create
    Blog.create(blog_params)
    # ヘッダのみを返す。201を返す。
    head :created
  end

  private

  def blog_params
    # ストロングパラメータで、titleとcontentsだけ作成を許可
    params.require(:blog).permit(:title, :contents)
  end
end
