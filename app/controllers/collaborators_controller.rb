class CollaboratorsController < ApplicationController

  before_action :set_wiki

  def create
    @collaborator = Collaborator.new(wiki_id: @wiki.id, user_id: params[:user_id])
    if @collaborator.save
      flash
      #....
    else
        #error flash
    end

    redirect_to edit_wiki_path(@wiki)
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])

    @collaborator.destroy

    redirect_to edit_wiki_path(@wiki)
  end


private
  def set_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end


end
