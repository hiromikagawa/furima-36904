# README

## user テーブル

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

 has_many :items
 has_many :cards

## items テーブル

| Column      | Type       | Options             |
|-------------|------------|---------------------|
| name        | string     | null: false         |
| text        | text       | null: false         |
| category_id | integer    | null: false         |
| status_id   | integer    | null: false         |
| postage_id  | integer    | null: false         |
| region_id   | integer    | null: false         |
| day_id      | integer    | null: false
| prise       | integer    | null: false         |
| user        | references | foreign_key: true   |


### Association

 belongs_to :user
 has_one :cards


## cards テーブル

| Column   | Type       | Options           |
|----------|------------|-------------------|
| item     | references | foreign_key: true |
| user     | references | foreign_key: true |

### Association

 belongs_to :items
 has_one  :deliverys
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
| card          | references | foreign_key: true |

### Association

 belongs_to :cards

