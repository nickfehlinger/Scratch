class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :post_categories
  has_many :favorites
  has_many :categories, through: :post_categories
  has_many :favorited_by, class_name: 'User', through: :favorites
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  validates_presence_of :title
  validates_presence_of :body
  validates_presence_of :photo
end
