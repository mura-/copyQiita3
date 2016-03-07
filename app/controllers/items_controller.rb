class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_item_tags_to_gon, only: [:edit]
  before_action :set_available_tags_to_gon, only: [:new, :edit]

  def index
    @items = Item.all
  end

  def show
    @stock = current_user.stocks.find_by(item_id: @item)
    @comment = current_user.comments.new
    @comments = @item.comments
    if @stock.blank?
      @stock = current_user.stocks.new
    end
  end

  def new
    @item = current_user.items.new
  end

  def edit
  end

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      redirect_to @item, notice: 'レコードを作成しました。'
    else 
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'レコードを更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_url, notice: '削除しました'
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:title, :content, :tag_list)
    end

    def set_item_tags_to_gon
      gon.item_tags = @item.tag_list
    end

    def set_available_tags_to_gon
      gon.available_tags = Item.tags_on(:tags).pluck(:name)
    end
end
