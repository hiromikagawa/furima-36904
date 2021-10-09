class Region < ActiveHash::Base
 self.data =[
   {id:1, name: '--'}
  {id: ２,name: '北海道'}, {id: ３, name: '青森県'}, {id: ４, name: '岩手県'},
  {id: ５, name: '宮城県'}, {id: ６, name: '秋田県'}, {id: ７, name: '山形県'},
  {id: ８, name: '福島県'}, {id: ９, name: '茨城県'}, {id: 10, name: '栃木県'},
  {id: 11, name: '群馬県'}, {id: 1２, name: '埼玉県'}, {id: 1３, name: '千葉県'},
  {id: 1４, name: '東京都'}, {id: 1５, name: '神奈川県'}, {id: 16, name: '新潟県'},
  {id: 17, name: '富山県'}, {id: 18, name: '石川県'}, {id: 19, name: '福井県'},
  {id: 20, name: '山梨県'}, {id: 21, name: '長野県'}, {id: 22, name: '岐阜県'},
  {id: 23, name: '静岡県'}, {id: 24, name: '愛知県'}, {id: 25, name: '三重県'},
  {id: 26, name: '滋賀県'}, {id: 27, name: '京都府'}, {id: 28, name: '大阪府'},
  {id: 29, name: '兵庫県'}, {id: 30, name: '奈良県'}, {id: 31, name: '和歌山県'},
  {id: 32, name: '鳥取県'}, {id: 33, name: '島根県'}, {id: 34, name: '岡山県'},
  {id: 35, name: '広島県'}, {id: 36, name: '山口県'}, {id: 37, name: '徳島県'},
  {id: 38, name: '香川県'}, {id: 39, name: '愛媛県'}, {id: 40, name: '高知県'},
  {id: 41, name: '福岡県'}, {id: 42, name: '佐賀県'}, {id: 43, name: '長崎県'},
  {id: 44, name: '熊本県'}, {id: 45, name: '大分県'}, {id: 46, name: '宮崎県'},
  {id: 47, name: '鹿児島県'}, {id: 48, name: '沖縄県'}
 ]
 include ActiveHash::Associations
 has_many:items
end