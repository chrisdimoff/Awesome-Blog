class Post < ApplicationRecord

  attr_accessor :facebook_post_this

  belongs_to :user
  has_many :comments, dependent: :destroy
  belongs_to :category

  has_many :favourites, dependent: :destroy
  has_many :favourited_posts, through: :favourites, source: :post

  validates :title, presence: true, length: {minimum: 7 }, uniqueness: {case_sensitive: false,
                                                  message: "must be unique" }



  validates :body, presence: true

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  def body_snippet
    if self.body.length > 100
      return "#{self.body[0..99]}..."
    else
      return self.body
    end
  end

  def short_create_date
    self.created_at.strftime('%m/%d/%Y')
  end

  def favourite_for(user)
    favourites.find_by(user: user)
  end

  def user_full_name
    if user
      user.full_name
    else
      'Anonymous'
    end
  end

end
