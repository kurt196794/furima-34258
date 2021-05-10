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
| Column                | Type   | Options     |
| --------              | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| encrypted_ppassword   | string | null: false |
| last_name             | string | null: false |
| first_name            | string | null: false |
| kana_Last_name        | string | null: false |
| kana_First name       | string | null: false |
| date                  | string | null: false |

# Association
- has_many  :item
- has_many  :sold

# items テーブル
| Column　　　    | Type       | Options                         |
| -------------  | ------     | ------------------------------- |
| name           | string     | null: false                     |
| user           | references | null: false, foreign_key: true  |
| price          | string     | null: false                     |
| Description    | text       | null: false                     |
| category       | string     | null: false                     |
| status         | string     | null: false                     |
| shipping       | string     | null: false                     |
| delivery_area  | string     | null: false                     |
| delivery_date  | string     | null: false                     |


# Association
- belongs_to :user
- has_one    :sold

# solds テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

# Association
- belongs_to :room
- belongs_to :item
- has_one    :add

# adds テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| sold           | references | null: false, foreign_key: true |
| content        | string     | null: false                    |
| postal_code    | string     | null: false                    |
| prefectures    | string     | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     | 
| phone_number   | string     | null: false                    |

# Association
- belongs_to :sold