FactoryBot.define do
    factory :renting, class: Renting do
        begin_date { Date.parse("2019-12-08") }
        end_date { Date.parse("2019-12-15") }
        client_name { "Cliente 1" }
    end

    factory :another_renting, class: Renting do
        begin_date { Date.parse("2019-12-16") }
        end_date { Date.parse("2019-12-19") }
        client_name { "Cliente 2" }
    end
end