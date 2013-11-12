class User < ActiveRecord::Base
  validates :name, :username, :email, :password, :password_confirmation, presence: true
  validates :username, uniqueness: { case_sensitive: false }

	acts_as_messageable

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, #:recoverable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :name, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :pins, :dependent => :destroy

  
  
end
