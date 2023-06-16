class Review < ApplicationRecord

  has_many_attached :images
  belongs_to :user
  belongs_to :category

   def get_images
    unless images.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      images.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    images
   end


   validates :nickname, presence: true
   validates :title, presence: true
   validates :introduction, presence: true
   validates :review_images, presence: true

end
