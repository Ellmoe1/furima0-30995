class OrdersController < ApplicationController
  before_action :authenticate_user!,only: [:index,:create]
  before_action :set_item,only: [:index,:create]
  before_action :move_to_toppage

  def index
    @item_purchase = ItemPurchase.new
  end

  def create
    @item_purchase = ItemPurchase.new(purchase_params)
    if @item_purchase.valid?
       pay_item
       @item_purchase.save
       redirect_to root_path
    else
        render action: :index
    end
  end

  private

  def purchase_params
    params.require(:item_purchase).permit(:postal_code,:prefecture_id,:city,:address,:building,:phoneno).merge(item_id: @item.id,user_id: current_user.id,token: params[:token])
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_toppage
    redirect_to root_path if (current_user.id == @item.user_id || @item.purchase.present?)
  end



end
