class AuthorsController < ApplicationController
    def index
        @authors = Author.all
    end

    def show
        @author = Author.find(params[:id])
    end

    def new
        @author = Author.new
    end

    def create
        @author = Author.create(author_params)

        if @author.valid?
            redirect_to author_path(@author)
        else
            flash[:error] = @author.errors.full_messages
            render :new
        end
    end

    def edit
        @author = Author.find(params[:id])
    end

    def update 
        @author = Author.find(params[:id])
        @author.update(author_params)
        if @author.valid?
            redirect_to author_path(@author)
        else
            flash[:error] = @author.errors.full_messages
            render :edit
        end
    end

    def destroy
        @author = Author.find(params[:id])
        @author.destroy
        redirect_to authors_path
    end

    private
    
    def author_params
        params.require(:author).permit(:name, :birth_year)
    end
end
