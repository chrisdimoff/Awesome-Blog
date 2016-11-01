class Tag < ApplicationRecord

  has_many :posts, through: :taggings
  has_many :taggings, dependent: :destroy

  validates :name, presence: true, uniqueness: {case_sensitive: false}

end
