class Customer::HomesController< ApplicationController
  
    def top
      @posts = Post.limit(10).order('id DESC')
      #@customers = Customer.all.order("id DESC")
      @customer = Customer.new
      @customers = Customer.all
      @posts = Post.all
      @post = Post.new
    @posts = @posts.page(params[:page])
    end


 def index
  @posts = Post.all
  @customers = Customer.all
  @post = Post.new
  @customer = current_customer
  @bookmarks = Bookmark.where(user_id: current_user.id)
 end


private
  def home_params
    params.require(:home).permit(:image, :address, :introduction, :hash_tags, :name)
  end

end