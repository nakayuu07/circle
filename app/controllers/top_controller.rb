class TopController < ApplicationController
  def index
    @collections = Collection.all.sample(6)
  end
end
