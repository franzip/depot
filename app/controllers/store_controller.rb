class StoreController < ApplicationController
  include CurrentCart

  before_action :set_cart
  skip_before_action :authorize

  def index
    session[:counter] = 0 if session[:counter].nil?
    session[:counter] += 1
    if params[:set_locale]
      redirect_to store_url(locale: params[:set_locale])
    else
      @products = Product.find_with_locale
    end
  end
end
