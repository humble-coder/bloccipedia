class WikisController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  
  def index
    @wikis = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    #@wiki = Wiki.new(params[:wiki])
    @wiki = current_user.wikis.build(params[:wiki])
    @wiki.users << current_user
    authorize @wiki
    if @wiki.save
      flash[:notice] = "Wiki saved successfully"
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving your wiki. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    if @wiki.update_attributes(params[:wiki])
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving your wiki. Please try again."
      render :edit
    end
  end

  # def destroy
  #   @wiki = Wiki.find(params[:wiki_id])
  #   @user = User.find(params[:id])
  #   @wiki.users.delete(@user)

  #   flash[:notice] = "Collaborator removed."
  # end
end
