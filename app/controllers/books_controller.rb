class BooksController < ApplicationController
  def top
  end

  def index
  		@books = Book.all.order(created_at: :desc)
      #=>新しい順の投稿一覧 #created_atは作成日時　descは降順
  		@book = Book.new

  end

  def show
      @book = Book.find(params[:id])

  end

  def new
  		@book = Book.new

  end

  def create
  		@book = Book.new(book_params)
     if @book.save
  		  redirect_to @book
        flash[:notice] = 'Book was successfully created'
     else 
        @books = Book.all.order(created_at: :desc)
        render 'index'
     end
  end

  def edit
  		@book = Book.find(params[:id])
  end

  def update
  		book = Book.find(params[:id])
      book.update(book_params)
  		redirect_to :action => 'show'
      flash[:notice] = 'Book was successfully updated'
      


  end

  def destroy
  		book = Book.find(params[:id]) #データを１件取得
  		book.destroy
  		redirect_to books_path
      flash[:notice] = 'Book was successfully destroyed'

  end

  private

  def book_params
  		params.require(:book).permit(:title, :body)
  end
end
