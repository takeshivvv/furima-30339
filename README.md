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

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| last-name             | string | null: false |
| first-name            | string | null: false |
| last-name-kana        | string | null: false |
| first-name-kana       | string | null: false |
| user_birth_date_1     | string | null: false |
| user_birth_date_2     | string | null: false |
| user_birth_date_3     | string | null: false |

### Association

- has_many :items
- has_one  :buyers



## items テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| image                 | string | null: false |
| item-name             | string | null: false |
| item-info             | text   | null: false |         
| item-category         | string | null: false |
| item-sales-status     | string | null: false |
| item-shipping-fee     | string | null: false |
| item-shipping-area    | string | null: false |
| item-days-to-ship     | string | null: false |
| item-price            | string | null: false |
| user                  |references|           |



### Association

- belongs_to :users
- has_one    :buyers


## buyers テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| card-number           | string | null: false |
| card-exp-month        | string | null: false |
| card-exp-year         | string | null: false |
| card-cvc              | string | null: false |
| user                  |references|           |
| item                  |references|           |

### Association

- belongs_to :users
- belongs_to :items
- has_one    :shipping-address



## shipping-address テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| postal-code           | string | null: false |
| prefecture            | string | null: false |
| city                  | text   | null: false |
| addresses             | text   | null: false |
| building              | text   | null: false |
| phone-number          | string | null: false |
| buyer                 |references|           |
### Association

- belongs_to :buyers