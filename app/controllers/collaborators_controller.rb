class CollaboratorsController < ApplicationController

  before_action :set_wiki

  def create
    @collaborator = Collaborator.new(wiki_id: @wiki.id, user_id: params[:user_id])
    if @collaborator.save
      flash[:notice] = "Your collaborator has been added to your wiki"
    else
      flash[:error] = "We couldn't save that collaborator to your wiki"
    end

    redirect_to edit_wiki_path(@wiki)
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])

    @collaborator.destroy
    flash[:error] = "The collaborator has been removed from your wiki"

    redirect_to edit_wiki_path(@wiki)
  end


private
  def set_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end


end
