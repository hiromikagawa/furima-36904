FactoryBot.define do
  factory :card_delivery do
   post_code {'771-4261'}
   prefecture_id{2}
   city{'徳島市'}
   address{'123'}
   building_name{'徳島ビル'}
   phone_number{'09062885389'}
   token {"tok_abcdefghijk00000000000000000"}
   association :user
   association :item
  end
end
