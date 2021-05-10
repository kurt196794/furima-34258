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
| email                 | string | null: false, uniqueness: true | 
| encrypted_ppassword   | string | null: false                   |
| last_name             | string | null: false                   |
| first_name            | string | null: false                   |
| kana_Last_name        | string | null: false                   |
| kana_First name       | string | null: false                   |
| birthday              | date   | null: false                   |

# Association
- has_many  :items
- has_many  :solds

# items テーブル
| Column　　　       | Type       | Options                         |
| ----------------  | ------     | ------------------------------- |
| name              | string     | null: false                     |
| user              | references | null: false, foreign_key: true  |
| price             | integer    | null: false                     |
| description       | text       | null: false                     |
| category_id       | string     | null: false                     |
| condition_id      | string     | null: false                     |
| shipping_id       | string     | null: false                     |
| delivery_area_id  | string     | null: false                     |
| delivery_date_id  | integer    | null: false                     |

# Association
- belongs_to :users
- has_one    :solds

# solds テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

# Association
- belongs_to :users
- belongs_to :items
- has_one    :addresses

# addresses テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| sold           | references | null: false, foreign_key: true |
| content        | string     | null: false                    |
| postal_code    | string     | null: false                    |
| delivery_area  | string     | null: false, foreign_key: true |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     | 
| phone_number   | string     | null: false                    |

# Association
- belongs_to :solds