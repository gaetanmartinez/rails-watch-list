class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @bookmarks = Bookmark.where(list_id: @list)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(strong_params)
    if @list.save!
      redirect_to list_path(@list), notice: 'Your list has been created'
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_path, notice:'Your list has been deleted'
  end

  private

  def strong_params
    params.require(:list).permit(:name)
  end
end
