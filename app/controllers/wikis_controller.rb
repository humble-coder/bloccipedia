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
    @wiki = current_user.wikis.build(params[:wiki])
    @wiki.users << current_user
    @wiki.public = true if !current_user.premium
    authorize @wiki
    if @wiki.save
      flash[:notice] = "Wiki saved successfully"
      redirect_to @wiki
    else
      if @wiki.title.empty? && @wiki.body.empty?
        flash[:error] = "Your wiki needs a title and a body!"
        render :new
      elsif @wiki.title.empty?
        flash[:error] = "Your wiki needs a title!"
        render :new
      elsif @wiki.body.empty?
        flash[:error] = "Your wiki needs a body!"
        render :new
      else
        flash[:error] = "There was an error saving your wiki. Please try again."
        render :new
      end
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
      if @wiki.title.empty? && @wiki.body.empty?
        flash[:error] = "The wiki needs a title and a body!"
        render :edit
      elsif @wiki.title.empty?
        flash[:error] = "The wiki needs a title!"
        render :edit
      elsif @wiki.body.empty?
        flash[:error] = "The wiki needs a body!"
        render :edit
      else
        flash[:error] = "There was an error saving your wiki. Please try again."
        render :edit
      end
    end
  end
end
