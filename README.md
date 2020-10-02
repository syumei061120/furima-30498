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
| first_name_kana  | string   | null: false                      |
| birthday         | date     | null: false                      |

### Association

-has_many :items
-has_many :purchaces

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| name             | string     | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | int        | null: false                    |
| status_id        | int        | null: false                    |
| postage_user_id  | int        | null: false                    |
| state_id         | int        | null: false                    |
| shipping_date_id | int        | null: false                    |
| price            | int        | null: false                    |

### Association

-belongs_to :user
-has_one :purchace

## purchaces テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

-has_one :address
-belongs_to :user
-belongs_to :item

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| purchace         | references | null: false, foreign_key: true |
| postal_code      | string     | null: false                    |
| state_id         | int        | null: false                    |
| city             | string     | null: false                    |
| address_line     | string     | null: false                    |
| building         | string     |                                |
| telephone        | string     | null: false                    |

### Association

-belongs_to :purchace

