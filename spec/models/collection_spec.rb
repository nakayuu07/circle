require 'rails_helper'

describe Collection do
  describe "#timeover?" do
    context "期限切れではない場合" do
      it "falseになる" do
        collection = FactoryGirl.create(:collection, :date_tomorrow)
        expect(collection.timeover?).to eq false
      end
    end

    context "期限切れだった場合" do
      it "trueになる" do
        collection = FactoryGirl.create(:collection, :date_yesterday)
        expect(collection.timeover?).to eq true
      end
    end

    context "イベント当日" do
      it "falseになる" do
        collection = FactoryGirl.create(:collection, :date_today)
        expect(collection.timeover?).to eq false
      end
    end
  end

  describe ".search" do
    let(:collection) { FactoryGirl.create(:collection) }
    let(:collection1) { FactoryGirl.create(:collection) }
    let(:collections) {[ collection,collection1 ]}

    context "検索ワードにマッチする場合" do
      it "完全一致の時一致する全てのイベントを取ってくる" do
        expect(Collection.search("test 1")).to match [collection] && []
      end

      it "部分一致の時その値が含まれる全てのイベントを取ってくる" do
        expect(Collection.search("es")).to match collections
      end
    end

    context "検索ワードにマッチしない場合" do
      it "検索ワードが存在しない場合" do
        expect(Collection.search("b")).to match []
      end

      it "検索ワードが空の場合" do
        expect(Collection.search("")).to match collections
      end
    end
  end

  describe ".set_flash_messages" do
    before do
      FactoryGirl.create(:collection)
    end

    context "検索ワードがあった場合" do
      it "完全一致の場合何も表示されない" do
        expect(Collection.set_flash_message("test")).to eq nil
      end

      it "部分一致の場合何も表示されない" do
        expect(Collection.set_flash_message("es")).to eq nil
      end
    end

    context "検索ワードがなかった場合" do
      it "検索結果はありませんと表示" do
        expect(Collection.set_flash_message("b")).to eq "イベントはありません"
      end
    end
  end
end
