class PagesController < ApplicationController
  def home
    @q = Species.search(params[:q])
    puts "xxxxxxxxxx#{@q}"
    @species = @q.result(distinct: true) if @q
  end
end
