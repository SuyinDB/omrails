class User < ActiveRecord::Base
  validates :name, :username, :email, presence: true
  validates :username, uniqueness: { case_sensitive: false }

  has_attached_file :avatar, styles: { small: "280x"}
  validates_attachment :avatar, content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                               size: { less_than: 5.megabytes }

	acts_as_messageable

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, #:recoverable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :name, :email, :avatar, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :pins, :dependent => :destroy
  
end
