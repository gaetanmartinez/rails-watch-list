class BookmarksController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(strong_params)
    @bookmark.list = @list
    if @bookmark.save!
      redirect_to root_path, notice: 'Your bookmark has been created'
    else
      render :new, notice: 'echec'
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to root_path, notice:'Your list has been deleted'
  end

  private

  def strong_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

end
