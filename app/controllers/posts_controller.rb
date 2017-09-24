class PostsController < ApplicationController
 before_action :set_post, only: [:edit, :update, :destroy]
 before_action :authenticate_user!

 def index
   @posts = Post.all
 end

 def new
   @post = Post.new
 end

 def create
   @post = Post.new(posts_params)
   @post.user_id = current_user.id
   if @post.save
     redirect_to posts_path, notice: "complete！"
     NoticeMailer.sendmail_post(@post).deliver
   else
     render 'new'
   end
 end

 def edit
 end

 def update
   if @post.update(posts_params)
     redirect_to posts_path, notice: "complete！"
   else
     render 'edit'
   end
 end

 def destroy
   @post.destroy
   redirect_to posts_path, notice: "complete！"
 end


 private
   def posts_params
     params.require(:post).permit(:content)
   end
   def set_post
     @post = Post.find(params[:id])
   end
 end
