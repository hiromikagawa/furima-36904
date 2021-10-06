# README

## user テーブル

| Column             | Type     | Options                   |
|--------------------|----------|---------------------------|
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| last_name          | string   | null: false               |
| first_name         | string   | null: false               |
| last_name_kana     | string   | null: false               |
| first_name_kana    | string   | null: false               |
| birthday           | datetime | null: false               |

### Association

 has_many :item
 has_many :card

## items テーブル

| Column      | Type       | Options             |
|-------------|------------|---------------------|
| name        | string     | null: false         |
| text        | text       | null: false         |
| category_id | integer    | null: false         |
| status_id   | integer    | null: false         |
| postage_id  | integer    | null: false         |
| region_id   | integer    | null: false         |
| prise       | integer    | null: false         |
| user        | references | foreign_key: true   |


### Association

 belongs_to :user
 has_one :card


## cards テーブル

| Column   | Type       | Options           |
|----------|------------|-------------------|
| items    | references | foreign_key: true |
| user     | references | foreign_key: true |

### Association

 belongs_to :item
 has_one  :delivery
 belongs_to :user
 

## deliverysテーブル

| Column        | Type       | Options           |
|---------------|------------|-------------------|
| post_code     | string     | null: false       |
| prefecture_id | integer    | null: false       |
| ctiy          | string     | null: false       |
| address       | string     | null: false       |
| building_name | string     |                   |
| phone_number  | integer    | null: false       |
| cards         | references | foreign_key: true |

### Association

 belongs_to :card

