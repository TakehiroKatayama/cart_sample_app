class CartsController < ApplicationController
  def show
    @cart_items = current_cart.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  # アイテムの追加
  def add_item
    @cart_item ||= current_cart.cart_items.build(product_id: params[:product_id])
    @cart_item.quantity += params[:quantity].to_i
    if @cart_item.save
      flash[:notice] = '商品が追加されました。'
      redirect_to my_cart_path
    else
      flash[:alert] = '商品の追加に失敗しました。'
      redirect_to product_url(params[:product_id])
    end
  end

  # アイテムの更新
  def update_item
    if @cart_item.update(quantity: params[:quantity].to_i)
      flash[:notice] = 'カート内の商品が更新されました'
    else
      flash[:alert] = 'カート内の商品の更新に失敗しました'
    end
    redirect_to my_cart_path
  end

  # アイテムの削除
  def delete_item
    if @cart_item.destroy
      flash[:notice] = 'カート内の商品が削除されました'
    else
      flash[:alert] = '削除に失敗しました'
    end
    redirect_to my_cart_path
  end

  private

  def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(product_id: params[:product_id])
  end
end
