class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :profile_pic, ImageUploader
  has_many :courses, :dependent => :delete_all
  has_many :lectures, :dependent => :delete_all
  has_many :comments, :dependent => :delete_all
  has_and_belongs_to_many :lectures

  # Validation
  validates :name , :presence => true
  validates :name, length: { in: 3..10 }

  validates :dob , :presence => true
  validate :date_of_birth_cannot_be_in_the_present

  def date_of_birth_cannot_be_in_the_present
    if dob.present? && dob > Date.today
      errors.add(:dob, "can't be in the present")
    end
  end

  validate :profile_pic_size_validation, :if => "profile_pic?"

  def profile_pic_size_validation
    errors[:profile_pic] << "should be less than 1MB" if profile_pic.size > 1.megabytes
  end

end
