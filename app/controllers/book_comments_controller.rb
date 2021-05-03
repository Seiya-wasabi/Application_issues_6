class BookCommentsController < ApplicationController
  def create
    book_comment = Book.find(params[:id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    comment.save
    redirect_to books_path
    # post_image = PostImage.find(params[:post_image_id])
    # comment = current_user.post_comments.new(post_comment_params)
    # comment.post_image_id = post_image.id
    # comment.save
    # redirect_to post_image_path(post_image)
  end

  def destroy
  end
  
    private

  def post_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
