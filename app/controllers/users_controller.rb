class UsersController < ApplicationController
before_filter :custom_method, :only => [:index ,:new, :edit, :create, :destroy]

  def index
    @users = User.all
    @bookmark=Bookmark.all
    @tags = Dog.tag_counts_on(:tags).order('count DESC')
  end
 
  def show
    @user = User.find(params[:id])
    @bookmark=Bookmark.all
    @dog=Dog.all
    @tags = Dog.tag_counts_on(:tags).order('count DESC')
  end

  def custom_method
  authenticate_user!

  if current_user.admin?
     return
  elsif current_user.member?
     redirect_to root_url # or whatever
  end
end
end