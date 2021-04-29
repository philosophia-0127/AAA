class CommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.book_id = @book.id
    if @comment.save
      flash[:notice] = 'You have created comment successfully.'
      redirect_to book_path(@book.id)
    else
      @user = @book.user  #ここの@bookは4行目で定義したもの。
      @new_book = Book.new
      render 'books/show'
    end
  end

  def destroy
    book = Book.find(params[:book_id])
    comment = book.comments.find(params[:id])
    comment.destroy
    redirect_to book_path(book.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
