class UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    if current_user.update_attributes(user_params)
      if current_user.standard?
        current_user.wikis.update_all(private: nil)
      end
      flash[:notice] = 'User account updated.'
      redirect_to edit_user_registration_path
    else
      flash[:error] = 'Unable to update account'
      redirect_to edit_user_registration_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:role)
  end
end
