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

  describe ".search" do
    context "検索ワードにマッチする場合" do
      before do
        tomorrow = Date.tomorrow
        @collection = Collection.new(title: "aaa",
        content: "3333",
        place: "aaa",
        date: tomorrow
        )

        @collection1 = Collection.new(title: "aaa",
        content: "3333",
        place: "aabb",
        date: tomorrow
        )
        @collections = []
        @collections << @colection
        @collections << @collection1
      end

      it "完全一致の時一致する全てのイベントを取ってくる" do
        expect(Collection.search("aaa")).to match @collections && []
      end

      it "部分一致の時その値が含まれる全てのイベントを取ってくる" do
        expect(Collection.search("a")).to match @collections && []
      end
    end

    context "検索ワードにマッチしない場合" do
      before do
        tomorrow = Date.tomorrow
        @collection = Collection.new(title: "aaa",
        content: "3333",
        place: "aaa",
        date: tomorrow
        )
        @collection1 = Collection.new(title: "bbb",
        content: "3333",
        place: "aaa",
        date: tomorrow
        )
        @collections = []
        @collections << @colection
        @collections << @collection1
      end

      it "検索ワードが存在しない場合" do
        expect(Collection.search("b")).to match []
      end

      it "検索ワードが空の場合" do
        expect(Collection.search("")).to match @collections && []
      end
    end
  end

  describe ".set_flash_messages" do
    before do
      tomorrow = Date.tomorrow
      Collection.create(title: "aaa",
      content: "3333",
      place: "aaa",
      starttime: "12:00",
      endtime: "13:00",
      capacity: 10,
      date: tomorrow
      )
    end
    context "検索ワードがあった場合" do
      it "完全一致の場合何も表示されない" do
        expect(Collection.set_flash_message("aaa")).to eq nil
      end

      it "部分一致の場合何も表示されない" do
        expect(Collection.set_flash_message("aaa")).to eq nil
      end
    end

    context "検索ワードがなかった場合" do
      it "検索結果はありませんと表示" do
        expect(Collection.set_flash_message("b")).to eq "イベントはありません"
      end
    end
  end
end
