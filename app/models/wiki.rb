class Wiki < ActiveRecord::Base
  has_many :collaborators
  belongs_to :user
  has_many :users, through: :collaborators

  scope :visible_to, -> (user) { (user.role != 'standard') ? all : where('private IS NULL or private = ?', false) }

  def collaborator_for(user)
    collaborators.where(user: user).first
  end

end
