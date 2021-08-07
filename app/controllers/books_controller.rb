class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]
  before_action :set_selects, only: %i[new edit create update]
  
  def index
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    respond_to do |format|
      if @book.save
        format.html {redirect_to @book, notice: "Libro Guardado Exitosamente"}
      else
        format.html {render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html {redirect_to @book, notice: "Libro Actualizado Correctamente"}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @book.destroy
    redirect_to root_path, notice: 'Libro Borrado Correctamente.'
  end
  
  def show
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :status, :borrowing_date, :return_date)
  end

  def set_book
     @book = Book.find(params[:id])
  end

  def set_selects
    #@statuses = Book.statuses.keys
    #@types = Book.book_types.keys.to_a
    #@styles = Book.styles.keys.to_a
    @statuses = Book.statuses.keys.to_a
  end

end