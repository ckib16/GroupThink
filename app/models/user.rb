class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :wikis, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

# Chris added these for callback to set default authroizaton w/ Pundit
  # before_create :set_role

  # private

  # def set_role
  #   role ||= "free"
  # end

end
