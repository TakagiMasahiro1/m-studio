class Picture < ApplicationRecord
  validates :text,    presence: true
  validates :image,   presence: true
  validates :account, presence: true

  belongs_to :user
  has_many :comments
  has_one_attached :image

  def self.search(search)
    if search != ""
      Picture.where('text LIKE(?)', "%#{search}%")
    else
      Picture.all
    end
  end
end
