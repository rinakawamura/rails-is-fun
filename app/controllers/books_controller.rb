class BooksController < ApplicationController
        def index
            @books = Book.all
        end
    
        def show
            @book = Book.find(params[:id])
            @author_book = AuthorBook.new
        end
    
        def new
            @book = Book.new
        end
    
        def create
            @book = Book.create(book_params)
    
            if @book.valid?
                redirect_to book_path(@book)
            else
                flash[:error] = @book.errors.full_messages
                render :new
            end
        end
    
        def edit
            @book = Book.find(params[:id])
        end
    
        def update 
            @book = Book.find(params[:id])
            @book.update(book_params)
            if @book.valid?
                redirect_to book_path(@book)
            else
                flash[:error] = @book.errors.full_messages
                render :edit
            end
        end
    
        def destroy
            @book = Book.find(params[:id])
            @book.destroy
            redirect_to book_path
        end
    
        private
        
        def book_params
            params.require(:book).permit(:title, :pages, author_ids: [])
        end
    

end
