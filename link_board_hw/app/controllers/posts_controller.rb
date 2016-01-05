class PostsController < ApplicationController
  def create
    post = Post.create post_params do |p|
      p.user_id = @current_user.id
      p.save
    end
    if post.valid?
      flash[:success] = 'Post created'
      redirect_to root_path
    else
      messages = post.errors.map { |k, v| "#{k} #{v}" }
      flash[:danger] = messages.join(', ')
      redirect_to new_post_path
    end
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find params[:id]
  end

  def show
    @post = Post.find params[:id]
    # render json: params
  end

  def update
    p = Post.find params[:id]
    p.update post_params
    redirect_to posts_path
  end

  def destroy
    result = Post.destroy params[:id]
    respond_to do |format|
      format.html {redirect_to :posts}
      format.json {render json: result}
    end
  end

  private

   def post_params
    params.require(:post).permit(:title, :link)
  end
end
