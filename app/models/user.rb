class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :set_default_role

  has_many :daily_report

  def full_name
    [first_name, last_name].join(' ')
  end

  def admin?
    self.role == 'admin'
  end

  def user? 
  	self.role == 'user'
  end

  private

  def set_default_role
    self.role ||= 'user'
  end
end
