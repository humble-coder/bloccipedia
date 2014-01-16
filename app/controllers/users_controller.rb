class UsersController < ApplicationController

  def index
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.search(params[:search])
  end

  def update
  	@wiki = Wiki.find(params[:wiki_id])
  	@user = User.find(params[:id])
  	@wiki.users << @user
    name = @user.name

  	if @wiki.users.include?(@user)
  		flash[:notice] = "Collaborator #{name} Added"
  		redirect_to @wiki
  	else
  		flash[:error] = "Collaborator #{name} Not Added - Please Try Again"
  		redirect_to @wiki
  	end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find(params[:id])
    @wiki.users.delete(@user)
    name = @user.name

    if !@wiki.users.include?(@user)
    	flash[:notice] = "Collaborator #{name} Removed"
    	redirect_to @wiki
    else
    	flash[:error] = "Collaborator #{name} Not Removed - Please Try Again"
    end
  end

end