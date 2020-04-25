class Article < ApplicationRecord

    #association 
    has_many :comments , dependent: :destroy
    #validation ->  title field
    validates :title, presence: true,length: { minimum: 5 }
    
end
