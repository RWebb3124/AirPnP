class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @pools = Pool.limit(12)
  end
end
