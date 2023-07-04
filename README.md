# README

## DB設計
---
## users table

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name_kanji   | string  | null: false               |
| last_name_kanji    | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birth_day          | date    | null: false               |


### Association

has_many: items
has_many: orders

---
## items table

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false, length:maximum    |
| description     | text       | null: false, length:maximum    |
| category_id     | integer    | null: false, ActiveHash        | 
| status_id       | integer    | null: false, ActiveHash        |
| burden_id       | integer    | null: false, ActiveHash        |
| prefecture_id   | integer    | null: false, ActiveHash        |
| shipping_day_id | integer    | null: false, ActiveHash        |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |


### Association

belongs_to :user
has_one_attached :image (ActiveStorage, NOTNULL)
has_one :order

extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category (include ActiveHash::Associations, has_many :items)
  belongs_to :status (include ActiveHash::Associations, has_many :items)
  belongs_to :burden (include ActiveHash::Associations, has_many :items)
  belongs_to :prefecture (include ActiveHash::Associations, has_many :items, address)
  belongs_to :shipping_day (include ActiveHash::Associations, has_many :items)

---
## orders table

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association

belongs_to :user
belongs_to :item
has_one :address
---
## addresses table

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false, ActiveHash        |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |


### Association

belongs_to :order
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :prefecture (include ActiveHash::Associations, has_many :items, address)

---

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
