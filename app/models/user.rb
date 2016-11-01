class User < ApplicationRecord

  attr_accessor :current_password

  has_many :posts
  has_many :comments

  has_secure_password

  before_validation :downcase_email

  has_many :favourites, dependent: :destroy
  has_many :users_who_favourited_posts, through: :favourites, source: :user

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email, presence: true,
                    uniqueness: {case_sensitive: false},
                    format: VALID_EMAIL_REGEX

  private

  def downcase_email
    self.email.downcase! if email.present?
  end
end
