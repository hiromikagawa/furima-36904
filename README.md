# README

## user テーブル

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false               |
| encrypted_password | string | null: false, unique: true |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |

### Association

_has_many :items
_h_as_many :card

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
| use_id      | references | foreign_key: true   |
| seller      | string     |                     |


### Association

_belongs_to :user
_has_one :card


## card テーブル

| Column     | Type       | Options           |
|------------|------------|-------------------|
| prise      | integer    | null: false       |
| items_id   | references | foreign_key: true |
| user_id    | references | foreign_key: true |
| buyer      | string     |                   |

### Association

_belongs_to :items
_has_one  :delivery

## deliveryテーブル

| Column        | Type       | Options           |
|---------------|------------|-------------------|
| post_code     | string     | null: false       |
| prefecture_id | integer    | null: false       |
| ctiy          | string     | null: false       |
| address       | string     | null: false       |
| building_name | string     |                   |
| phone_number  | integer    | null: false       |
| card_id       | references | foreign_key: true |

### Association

_belongs_to :card

