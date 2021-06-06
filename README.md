# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# テーブル設計

# users テーブル
| Column                | Type   | Options                       |
| --------              | ------ | ----------------------------  |
| nickname              | string | null: false                   |
| email                 | string | null: false, unique:true      | 
| encrypted_ppassword   | string | null: false                   |
| last_name             | string | null: false                   |
| first_name            | string | null: false                   |
| kana_last_name        | string | null: false                   |
| kana_first_name       | string | null: false                   |
| birthday              | date   | null: false                   |

# Association
- has_many  :items
- has_many  :solds

# items テーブル
| Column          | Type       | Options                         |
| ----------------  | ------     | ------------------------------- |
| name              | string     | null: false                     |
| user              | references | null: false, foreign_key: true  |
| price             | integer    | null: false                     |
| description       | text       | null: false                     |
| category_id       | integer    | null: false                     |
| condition_id      | integer    | null: false                     |
| shipping_id       | integer    | null: false                     |
| delivery_area_id  | integer    | null: false                     |
| delivery_date_id  | integer    | null: false                     |

# Association
- belongs_to :user
- has_one    :sold

# solds テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

# Association
- belongs_to :user
- belongs_to :item
- has_one    :address

# addresses テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| sold             | references | null: false, foreign_key: true |
| postal_code      | string     | null: false                    |
| delivery_area_id | integer    | null: false  
|
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |

# Association
- belongs_to :sold