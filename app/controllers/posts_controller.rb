class PostsController < ApplicationController
  def new
    @post = Post.new
   
  end

  def create
   @post = Post.new(post_params)
   if @post.save
   flash[:notice] = "Post dodany pomyślnie."
   redirect_to posts_path
   else
    render action: 'new'
   end
  end


  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
    flash[:notice] = "Post zaktualizowany pomyślnie"
    redirect_to posts_path
    else
      render action: 'edit'
    end

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Pomyślnie usunięto wpis"
    redirect_to posts_path
  end


  def edit
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  private 

  def post_params
    params.require(:post).permit(:title, :author, :body, :published)
  end
end
