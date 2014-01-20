class UsersController < ApplicationController

  def update
  	@wiki = Wiki.find(params[:wiki_id])
  	@user = User.find(params[:id])
    name = @user.name

    if @wiki.users.include?(@user)
      flash[:error] = "Collaborator #{name} already included."
      redirect_to @wiki
    else
      @wiki.users << @user
      if @wiki.users.include?(@user)
        flash[:notice] = "Collaborator #{name} Added"
        redirect_to @wiki
      else
        flash[:error] = "Collaborator #{name} Not Added - Please Try Again"
        redirect_to @wiki
      end
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
      redirect_to @wiki
    end
  end

end