class HomeController < ApplicationController
  def index
    redirect_to queue_index_path if user_signed_in?
  end

  def terms
  end

  def faq
  end
end
