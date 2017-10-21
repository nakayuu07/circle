class TopController < ApplicationController
  def index
    @collection = Collection.all.sample(6)
  end
end
