# テーブル設計

## users テーブル

| Column           | Type     | Options                          |
| ---------------- | -------- | -------------------------------- |
| nickname         | string   | null: false                      |
| email            | string   | null: false                      |
| password         | string   | null: false                      |
| family_name      | string   | null: false                      |
| first_name       | string   | null: false                      |
| family_name_kana | string   | null: false                      |
| first_name       | string   | null: false                      |
| birth_year       | int      | null: false                      |
| birth_month      | int      | null: false                      |
| birth_day        | int      | null: false                      |

### Association

-has_many :items
-has_many :purchaces

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| name             | string     | null: false                    |
| explanation      | string     | null: false                    |
| category         | int        | null: false                    |
| status           | int        | null: false                    |
| postage_user     | int        | null: false                    |
| shipping_from    | int        | null: false                    |
| shipping_date    | int        | null: false                    |
| price            | int        | null: false                    |

### Association

-belongs_to :user
-has_one :purchace

## purchaces テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |
| card_number      | int        | null: false                    |
| card_year        | int        | null: false                    |
| card_month       | int        | null: false                    |
| postal_code      | string     | null: false                    |
| state            | string     | null: false                    |
| city             | string     | null: false                    |
| address_line     | string     | null: false                    |
| building         | string     |                                |
| telephone        | string     | null: false                    |

### Association

-belongs_to :user
-belongs_to :item
