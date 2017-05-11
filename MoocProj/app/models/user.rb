class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :profile_pic, ImageUploader
  has_many :courses
  has_many :lectures
  has_many :comments
    has_and_belongs_to_many :lectures
end
