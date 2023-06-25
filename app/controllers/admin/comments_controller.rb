class Admin::CommentsController < ApplicationController

def index
    @comments = Comment.all
    @comment = Comment.new
    @customers = Customer.all
    @customer = Customer.new
    @posts = Post.all
    @post = Post.new
    #@comments = Comment.page(params[:page]).per(10)
    @comment = Comment.all.order("created_at DESC")
end

def show
    @comments = Comment.all
    @comment = Comment.new
    @customers = Customer.all
    @customer = Customer.new
    @posts = Post.all
    @post = Post.new
    #@comments = Comment.where(id: params[:id])
    @comments = Comment.find(params[:id])
    #@customer = Customer.find(params[:id])
end




  private
    def post_comment_params
      params.require(:comment).permit(:id, :customer_id, :post_id, :comment)
    end


end