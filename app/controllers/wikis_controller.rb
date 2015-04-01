class WikisController < ApplicationController
  before_action :set_wiki, only: [:show, :edit, :update, :destroy]

  # GET /wikis
  def index
    @wikis = Wiki.all
  end

  # GET /wikis/1
  def show
    @wikis = Wiki.find(params[:id])
  end

  # GET /wikis/new
  def new
    @wiki = Wiki.new
  end

  # GET /wikis/1/edit
  def edit
  end

  # POST /wikis
  def create
    
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user

    # Stuck, not getting params and can't associate wiki to the current user
    # @user = User.find(params[:user_id])
    # @wiki = @user.wikis
    # @new_wiki = Wiki.new

    # @wiki = current_user.wikis.build( wiki_params )
    # @wiki.user = @user

    respond_to do |format|
      if @wiki.save
        format.html { redirect_to @wiki, notice: 'Wiki was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /wikis/1
  def update
    respond_to do |format|
      if @wiki.update(wiki_params)
        format.html { redirect_to @wiki, notice: 'Wiki was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /wikis/1
  def destroy
    @wiki.destroy
    respond_to do |format|
      format.html { redirect_to wikis_url, notice: 'Wiki was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wiki
      @wiki = Wiki.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wiki_params
      params.require(:wiki).permit(:title, :body, :private, :user_id)
    end
end
