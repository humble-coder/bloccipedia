class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(params[:wiki])
    if @wiki.save
      flash[:notice] = "Wiki saved successfully"
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving your wiki. Please try again."
      render :new
    end
  end

  def edit
  end
end
