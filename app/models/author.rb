class Author < ApplicationRecord
    has_many :author_books, dependent: :destroy
    has_many :books, through: :author_books

    validates :name, presence: true
    validates :birth_year, presence: true
    validates :birth_year, numericality: {only_integer: true}
end
