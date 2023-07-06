class BooksController < ApplicationController
  def index
    @books = Book.all
    
    @book = Book.new
  end
  
  def create
    @book = Book.new(books_params)
    if @book.save
      flash[:notice] = "New book was successfully posted."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(books_params)
    redirect_to books_path(book.id)
    flash[:notice] = "The book was successfully updated"
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "The book was successfully deleted"
    redirect_to '/books'
  end

  private
    def books_params
      params.require(:book).permit(:title, :body)
    end

end
