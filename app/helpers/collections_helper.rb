module CollectionsHelper
  def joins_counter(joins)
    joiner = joins.count
  end

  def timeover(collection)
    if collection.date < Date.today
      return true
    end
  end
end
