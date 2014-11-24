class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :item, :import_with_new_item, :import_with_existing_item]
  before_action :set_query
  before_action :set_navigation

  def index
    if params[:query].present?
      @items = Item.search @query, where: {babysousou_item_id: nil}, page: params[:page], per_page: 20, fields: [:title, :description], highlight: {fields: [:title, :description], tag: '<strong>'}
    else
      @items = Item.not_imported.page params[:page]
    end
  end

  def show
  end

  def item
    @item.build_babysousou_item(title: @item.title, description: @item.description)
    @babysousou_items = BabysousouItem.all
    respond_to { |format| format.js }
  end

  def import_with_new_item
    item = item_params_with_new_item
    unless item[:babysousou_item].nil?
      babysousou_item = BabysousouItem.new(item[:babysousou_item])
      babysousou_item.save
      if @item.update(babysousou_item: babysousou_item)
        redirect_to items_path(query: @query), notice: 'Successfully imported'
      end
    end
  end

  def import_with_existing_item
    item = item_params_with_existing_item
    unless item[:babysousou_item].nil?
      babysousou_item = BabysousouItem.find(item[:babysousou_item])
      if @item.update(babysousou_item: babysousou_item)
        redirect_to items_path(query: @query), notice: 'Successfully imported'
      end
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_query
    @query = params[:query]
  end

  def set_navigation
    @navigation = 'items'
  end

  def item_params_with_new_item
    params.require(:item).permit(babysousou_item: [:title, :description])
  end

  def item_params_with_existing_item
    params.require(:item).permit(:babysousou_item)
  end
end
