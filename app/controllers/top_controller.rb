class TopController < ApplicationController
  def index
    @collections = Collection.where('date > ?', Date.today).sample(6)
  end
end
