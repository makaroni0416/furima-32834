# テーブル設計

## users テーブル

| Column                     | Type     | Options                   |
| -------------------------  | -------  | -----------------------   |
| name                       | string   | null: false               |
| encrypted_password         | string   | null: false               |
| email                      | string   | null: false, unique: true |
| birthday                   | date     | null: false               |
| family_name                | string   | null: false               |
| first_name                 | string   | null: false               |
| family_name_kana           | string   | null: false               |
| first_name_kana            | string   | null: false               |


### Association
- has_many :purches_records
- has_many :displays

## purches_records テーブル

| Column       | Type         | Options                       |
| ----------   | -----------  | ---------------------------   |
| user         | references   | null: false, foreign_key:true |
| display      | references   | null: false, foreign_key:true |

### Association
- has_one :address
- belongs_to :user
- belongs_to :displays

## displays テーブル
| Column            | Type         | Options     |
| ---------------   | -----------  | ----------- |
| product           | string       | null: false |
| product_text      | text         | null: false |
| category_id       | integer      | null: false |
| product_status_id | integer      | null: false |
| delivery_price_id | integer      | null: false |
| prefecture_id     | integer      | null: false |
| shipping_date_id  | integer      | null: false |
| price             | integer      | null: false |

### Association
- belongs_to :user
- has_one :purches_recods

## addressテーブル
| Column          | Type         | Options     |
| ------------    | -----------  | ----------- |
| postcode        | string       | null: false |
| prefecture_id   | integer      | null: false |
| city            | string       | null: false |
| block           | string       | null: false |
| building        | string       |             |
| phone_number    | string       | null: false |

### Association
- belongs_to :purches_records


