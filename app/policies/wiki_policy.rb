class WikiPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    user.present? || record.private == nil
  end

end