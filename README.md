# テーブル設計

## users テーブル

| Column                     | Type   | Options     |
| -------------------------  | -----  | ---------   |
| name                       | string | null: false |
| password                   | string | null: false |
| birthday                   | string | null: false |
| family_name                | text   | null: false |
| first_name                 | text   | null: false |
| family_name_kana           | text   | null: false |
| first_name_kana            | text   | null: false |


### Association
- has_many :purches_records
- has_many :displays

## purches_records テーブル

| Column       | Type         | Options                       |
| ----------   | -----------  | ---------------------------   |
| user         | references   | null: false, foreign_key:true |
| display      | references   | null: false, foreign_key:true |                 |

### Association
- has_one :address
- belongs_to :user
- belongs_to :displays

## displays テーブル
| Column         | Type         | Options     |
| ------------   | -----------  | ----------- |
| product        | string       | null: false |
| product_text   | text         | null: false |
| category       | string       | null: false |
| product_status | string       | null: false |
| delivery_price | string       | null: false |
| prefecture_id  | string       | null: false |
| shipping_date  | string       | null: false |
| price          | string       | null: false |

### Association
- belongs_to :user
- has_one :purches_recods

## addressテーブル
| Column          | Type         | Options       |
| ------------    | -----------  | -----------   |
| postcode        | string       | null: false |
| prefecture_id   | text         | null: false |
| city            | string       | null: false |
| block           | string       | null: false |
| building        | string       | null: false |
| phone_number    | string       | null: false |

### Association
- belongs_to :purches_records


