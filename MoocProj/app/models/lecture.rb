class Lecture < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
  belongs_to :Course
  belongs_to :User
  has_many :comments
  has_and_belongs_to_many :users
  acts_as_votable
end
