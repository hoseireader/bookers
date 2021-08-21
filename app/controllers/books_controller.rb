class BooksController < ApplicationController


  def show
    @book=Book.find(params[:id])
  end

  def index
    @book=Book.new
    @books = Book.all
  end

  def edit
    @book=Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])
    @books = Book.all
    if @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to "/books/#{@book.id}"     #book_path(@book)
    else
    render :edit
    end
  end

  def create
    # １. データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    @books = Book.all
    # ２. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
    # ３. リダイレクト
    flash[:notice] = "Book was successfully created."
    redirect_to "/books/#{@book.id}"
    else
    render :index

    end

  end

  def destroy
    book = Book.destroy(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  # ストロングパラメータ ◎privateはControllerファイルの一番下のendのすぐ上に書いて下さい。
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
