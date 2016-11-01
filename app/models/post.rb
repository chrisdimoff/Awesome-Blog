class Post < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  belongs_to :category

  has_many :favourites, dependent: :destroy
  has_many :favourited_posts, through: :favourites, source: :post

  validates :title, presence: true, length: {minimum: 7 }, uniqueness: {case_sensitive: false,
                                                  message: "must be unique" }



  validates :body, presence: true

  def body_snippet
    if self.body.length > 100
      return "#{self.body[0..99]}..."
    else
      return self.body
    end
  end

  def favourite_for(user)
    favourites.find_by(user: user)
  end

end
