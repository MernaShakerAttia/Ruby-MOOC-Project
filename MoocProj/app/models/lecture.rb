class Lecture < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
  belongs_to :Course
  belongs_to :User
  has_many :comments, :dependent => :delete_all;
  has_and_belongs_to_many :users
  acts_as_votable

  #validation
  validates :content , :presence => true
  validates :content, length: { in: 10..500 }

  validates :Course_id , :presence => true
  validates :User_id , :presence => true

  validate :attachment_size_validation, :if => "attachment?"

  def attachment_size_validation
    errors[:attachment] << "should be less than 1MB" if attachment.size > 1.megabytes
  end

end
