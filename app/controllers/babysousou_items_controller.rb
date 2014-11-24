class BabysousouItemsController < ApplicationController
  before_action :set_babysousou_item, only: [:edit, :show, :destroy, :update]
  before_action :set_navigation

  def index
    @babysousou_items = BabysousouItem.page params[:page]
  end

  def new
    @babysousou_item = BabysousouItem.new
  end

  def edit
  end

  def show
  end

  def create
    @babysousou_item = BabysousouItem.new(babysousou_item_params)
    if @babysousou_item.save
      redirect_to babysousou_item_path, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  def update
    if @babysousou_item.update(babysousou_item_params)
      redirect_to babysousou_item_path, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @babysousou_item.destroy
    redirect_to babysousou_items_path, notice: 'Item was successfully deleted.'
  end

  private

  def set_babysousou_item
    @babysousou_item = BabysousouItem.find(params[:id])
  end

  def set_navigation
    @navigation = 'babysousou_items'
  end

  def babysousou_item_params
    params.require(:babysousou_item).permit(:title, :description)
  end
end
