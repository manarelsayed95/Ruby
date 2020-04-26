class Comment < ApplicationRecord
  #association
  belongs_to :article
  belongs_to :user
end
