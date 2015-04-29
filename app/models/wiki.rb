class Wiki < ActiveRecord::Base
  belongs_to :user

  scope :visible_to, -> (user) { (user.role != 'standard') ? all : where('private IS NULL or private = ?', false) }

end
