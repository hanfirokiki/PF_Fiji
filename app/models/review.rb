class Review < ApplicationRecord

  has_many_attached :images
  belongs_to :user
  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :introduction, presence: true
  validates :images, presence: true

  def get_images
    unless images.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      images.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    images
  end

  def liked?(user)
    likes.where(user_id: user.id).exists?
  end


end
