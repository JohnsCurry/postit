class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :vote]
  before_action :require_user, except: [:index, :show] 

  def index
    @posts = Post.all.sort_by{|x| x.total_votes}.reverse
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user
    if @post.save
      flash[:notice] = "Your post has been saved!"
      redirect_to posts_path
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post was updated"
      redirect_to posts_path
    else
      render :edit
    end
  end

  def vote
    Vote.create(voteable: @post, creator: current_user, vote: params[:vote])
   
    respond_to do |format|
      format.html {redirect_to :back, notice: "Your vote was counted"}
      format.js
    end

  end

  private

  def post_params
    params.require(:post).permit!
  end

  def set_post
    @post = Post.find(params[:id])
  end


end
