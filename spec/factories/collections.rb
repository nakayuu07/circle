FactoryGirl.define do
  factory :collection do
    sequence(:title) { |n| "test #{n}"}
    content "10"
    place "渋谷"
    starttime "12:00"
    endtime "13:00"
    capacity 10
    date 1.week.from_now

    trait :date_tomorrow do
      date 1.day.from_now
    end

    trait :date_today do
      date Date.current.in_time_zone
    end

    trait :date_yesterday do
      date 1.day.ago
    end
  end
end
