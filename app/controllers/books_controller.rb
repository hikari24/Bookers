class BooksController < ApplicationController
  def index
  		@lists = List.all
  end
  

  def show

  end

  def new
  	
  end

  def create
  		book = Book.new(book_params)
  		book.save
  		#詳細画面へリダイレクト
  		redirect_to '/top'
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def book_params
  		params.require(:book).permit(:title, :body)
  end

 end
