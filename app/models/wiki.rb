class Wiki < ActiveRecord::Base
  belongs_to :user # creator of wiki
  has_many :collaborators
  has_many :users, through: :collaborators

  def collaborator_for(user)
    collaborators.where(user: user).first
  end

  def public?
    !private?
  end

end
