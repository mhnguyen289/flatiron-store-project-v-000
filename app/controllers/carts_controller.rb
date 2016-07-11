class CartsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_cart, only: [:show, :checkout, :edit, :update, :destroy]

  def show
  end

  def checkout
    @cart.checkout
    current_user.current_cart = nil
    current_user.save
    redirect_to cart_path(@cart)
  end

  private
  def set_cart
    @cart = Cart.find(params[:id])
    redirect_to store_path if @cart.nil?
  end


end