class User < ApplicationRecord
	has_many :posts
	has_many :comments
	has_many :favorites
	has_many :favorite_posts, class_name: 'Post', through: :favorites
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
    validates_presence_of :email, uniqueness: true
    validates_presence_of :password
    validates_presence_of :username, uniqueness: true

end
