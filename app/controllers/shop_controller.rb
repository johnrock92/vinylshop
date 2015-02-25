class ShopController < ApplicationController
  def index
  	@vinyls = Vinyl.order("artist asc").all
  end
end
