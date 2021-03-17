class Comment < ApplicationRecord
  belongs_to :picture
  belongs_to :user  

  validates :text, presence: true
end
