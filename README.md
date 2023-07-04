# README

## DB設計
---
## users Tabel

| Column           | Type    | Options                   |
| ---------------- | ------- | ------------------------- |
| nickname         | string  | null: false               |
| email            | string  | null: false, unique: true |
| password         | string  | null: false, format       |
| first_name_kanji | string  | null: false               |
| last_name_kanji  | string  | null: false               |
| last_name_kana   | string  | null: false               |
| last_name_kana   | string  | null: false               |
| birth_day        | date    | null: false               |


### Association

has_many: items
has_many: orders

---
## items Table

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false, length:maximum    |
| description   | text       | null: false, length:maximum    |
| category_id   | integer    | null: false, ActiveHash        | 
| status_id     | integer    | null: false, ActiveHash        |
| burden_id     | integer    | null: false, ActiveHash        |
| prefecture_id | integer    | null: false, ActiveHash        |
| day_id        | integer    | null: false, ActiveHash        |
| price         | integer    | null: false, format            |
| user          | references | null: false, foreign_key: true |


### Association

belongs_to :user
has_one_attached :image (ActiveStorage, NOTNULL)
has_one :order, dependent: :destroy

extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category (include ActiveHash::Associations, has_many :items)
  belongs_to :status (include ActiveHash::Associations, has_many :items)
  belongs_to :burden (include ActiveHash::Associations, has_many :items)
  belongs_to :prefecture (include ActiveHash::Associations, has_many :items, address)
  belongs_to :day (include ActiveHash::Associations, has_many :items)

---
## orders Table

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association

belongs_to :user
has_one :item
has_one :address, dependent: :destroy

---
## addresses Tabel

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false, format            |
| prefecture_id | integer    | null: false, ActiveHash        |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null:false, format             |
| order         | references | null: false, foreign_key: true |


### Association

has_one :order
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
