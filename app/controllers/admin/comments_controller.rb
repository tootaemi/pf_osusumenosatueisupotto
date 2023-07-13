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
      @comments = @comments.page(params[:page])
    end
    
    def show
      @comment = Comment.find(params[:id])
      @customer = @comment.customer
    end
    
    def create
      @comment = current_customer.comments.new(comment_params)
      if @comment.save
        redirect_back(fallback_location: root_path)  #コメント送信後は、一つ前のページへリダイレクトさせる。
      else
        redirect_back(fallback_location: root_path)  #同上
      end
    end
    
    def destroy
      comment = Comment.find(params[:id])
      comment.destroy
      @comment = comment.post
        redirect_to admin_comments_path(@comment)
    end
    
    private
    def comment_params
      params.require(:comment).permit(:customer_id, :post_id, :comment)
    end

end