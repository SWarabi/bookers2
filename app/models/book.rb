class Book < ApplicationRecord
   has_one_attached :image
   belongs_to :user
   def index 
     @books = Book.all
   end
end
