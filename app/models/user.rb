class User < ActiveRecord::Base
  has_secure_password
  validates :password, :length => { :minimum => 8 }, :if => :password
  validates :email, :presence => true, :uniqueness => true
  before_save :downcase_fields
  has_many :posts

  def downcase_fields
    self.email.downcase!
  end
end
