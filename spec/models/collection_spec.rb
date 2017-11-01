require 'rails_helper'

describe Collection do
  describe "#timeover?" do
    context "期限切れではない場合" do
      it "falseになる" do
        today = Date.today
        Timecop.travel(10.days.ago)
        collection = Collection.new(title: "aaa",
        content: "3333",
        place: "aaa",
        date: today
        )
        expect(collection.timeover?).to eq false
      end
    end

    context "期限切れだった場合" do
      it "trueになる" do
        today = Date.today
        Timecop.travel(1.day.from_now)
        collection = Collection.new(title: "aaa",
        content: "3333",
        place: "aaa",
        date: today
        )
        expect(collection.timeover?).to eq true
      end
    end

    context "イベント当日" do
      it "falseになる" do
        today = Date.today
        collection = Collection.new(title: "aaa",
        content: "3333",
        place: "aaa",
        date: today
        )
        expect(collection.timeover?).to eq false
      end
    end
  end
end
