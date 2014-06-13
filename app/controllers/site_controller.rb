class SiteController < ApplicationController

  #action_name.format.template   -all file names follow this format.

  def index
    @products = Product.all
    @cars = Car.all
  end

  def about

  end

end
