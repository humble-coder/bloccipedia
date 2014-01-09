class UsersController < ApplicationController

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find(params[:id])
    @wiki.users.delete(@user)

    flash[:notice] = "Collaborator removed."
    redirect_to @wiki
  end

end