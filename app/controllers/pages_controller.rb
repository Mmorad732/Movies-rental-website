class PagesController < ApplicationController
  skip_before_action :authenticate_admin , :only => [:index , :about]
  def index
  end
  def about
  end
end
