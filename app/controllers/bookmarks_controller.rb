class BookmarksController < ApplicationController
  before_action :authorized, only: [:user_bookmarks, :add_or_remove_bookmark]

  def user_bookmarks
    render json: @user.bookmarks
  end

  def add_or_remove_bookmark
    
    bookmark = Bookmark.find_by(establishment: params[:establishment][:id], user_id: @user[:id])

    if !bookmark
      bookmark = Bookmark.create(establishment_id: params[:establishment][:id], user_id: @user[:id]) 
    else
      bookmark.destroy
    end

    render json: bookmark
  end
end
