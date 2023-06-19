class User < ApplicationRecord
  GUEST_USER_EMAIL = "guest@example.com"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :profile_image

  validates :nickname, presence:true, length: { minimum: 2, maximum: 20 }
  validates :email, presence:true, length: { minimum: 2, maximum: 20 }


  def get_profile_image(width, height)
    unless profile_image.attached?
     file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end


  # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.nickname = 'guestuser'
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
