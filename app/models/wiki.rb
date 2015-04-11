class Wiki < ActiveRecord::Base
  belongs_to :user
    
  scope :visible_to, -> (user) { (user.role != 'standard') ? all : where(private: nil) }

end
