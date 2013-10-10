class PostsController < ApplicationController
#before_filter :authenticate_member!, :except => [:show, :index]
before_filter :authenticate_member!
def new
end

def create
  @post = current_member.posts.new(post_params)
 
  if @post.save
    redirect_to @post
  else
    render 'new'
  end
end
 
def show
  @post = current_member.posts.find(params[:id])
end 
 
 def index
  @posts = current_member.posts.all
end

def edit
  @post = current_member.posts.find(params[:id])
end

def update
  @post = current_member.posts.find(params[:id])
 
  if @post.update(post_params)
    redirect_to @post
  else
    render 'edit'
  end
end 
 
def destroy
  @post = current_member.posts.find(params[:id])
  @post.destroy
 
  redirect_to posts_path
end
 
private
  def post_params
    params.require(:post).permit(:title, :text)
  end

end
