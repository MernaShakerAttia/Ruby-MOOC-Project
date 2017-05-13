class Course < ActiveRecord::Base
  belongs_to :User
  has_many :lectures, :dependent => :delete_all

  # Validation
  validates :title , :presence => true
  validates :title, length: { in: 3..50 }

  validates :User_id , :presence => true

end
