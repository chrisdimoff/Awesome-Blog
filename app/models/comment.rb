class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :body, presence: true, uniqueness: {scope: :post_id}

  def comment_snippet
    if self.body.length > 140
      return "#{self.body[0..139]}..."
    else
      return self.body
    end
  end

  def user_full_name
    if user
      user.full_name
    else
      'Anonymous'
    end
  end

  
end
