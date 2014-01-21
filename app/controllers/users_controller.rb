class UsersController < ApplicationController
  respond_to :html, :js

  def update
  	@wiki = Wiki.find(params[:wiki_id])
  	@user = User.find(params[:id])
    name = @user.name

    @wiki.users << @user if !@wiki.users.include?(@user)
    if @wiki.users.include?(@user)
      flash[:notice] = "Collaborator #{name} Added"
    end

    respond_with(@wiki, @user) do |f|
      f.html { redirect_to @wiki }
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find(params[:id])
    @wiki.users.delete(@user)
    name = @user.name

    if !@wiki.users.include?(@user)
    	flash[:notice] = "Collaborator #{name} Removed"
    end

    respond_with(@wiki, @user) do |f|
      f.html { redirect_to @wiki }
    end
  end

end