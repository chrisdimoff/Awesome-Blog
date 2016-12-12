class User < ApplicationRecord

  attr_accessor :current_password, :reset_token

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
                    format: VALID_EMAIL_REGEX,
                    unless: :from_oauth?


  def full_name
  "#{first_name} #{last_name}".strip.squeeze(' ').titleize
  end

  def User.digest(string)
   cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost

   BCrypt::Password.create(string, cost: cost)
 end

 # Returns a random token.
 def User.new_token
   SecureRandom.urlsafe_base64
 end

 def create_reset_digest
     self.reset_token = User.new_token
     update_attribute(:reset_digest,  User.digest(reset_token))
     update_attribute(:reset_sent_at, Time.zone.now)
     puts "#{self.reset_token}"
end


def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      full_name = auth['info']['name'].split
      user.first_name = full_name[0]
      user.last_name = full_name[1]
      user.password = SecureRandom.hex(32)
      user.email = auth['info']['email']
      user.oauth_secret  = auth['credentials']['secret']
      user.oauth_raw_data =  auth
      user.provider = auth.provider
      user.uid = auth.uid
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
end

def signed_in_with_facebook?
  uid.present? && provider == 'facebook'
end


def from_oauth?
  provider.present? && uid.present?
end

  private

  def downcase_email
    self.email.downcase! if email.present?
  end
end
