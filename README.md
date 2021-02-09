# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------  | ------------------------- |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| memo               | text    |                           |


### Association

- has_many :orders
- has_many :comments

## customers テーブル

| Column            | Type        | Options                        |
| ----------------  | ----------  | ------------------------------ |
| first_name        | string      | null: false                    |
| last_name         | string      | null: false                    |
| company           | string      |                                |
| email             | string      | null: false, unique: true      |
| tel               | string      | null: false                    |
| post_code         | string      | null: false                    |
| place_id          | integer     | null: false                    |
| city              | string      | null: false                    |    
| street_num        | string      | null: false                    |
| building          | string      |                                |
| memo              | text        |                                |  

### Association

- has_many :orders


## items テーブル

| Column            | Type        | Options                        |
| ----------------- | ----------  | -------------------------------|
| code              | string      | null: false                    |
| name              | string      | null: false                    |
| condition_id      | integer     | null: false                    |
| price             | integer     | null: false                    |
| color             | string      |                                |
| size              | string      |                                |
| stock_num         | integer     | null: false                    |


### Association

- has_many :order_items
- has_many :orders, trough: :order_items

## orders テーブル

| Column           | Type        | Options                        |
| ---------------- | ----------  | ------------------------------ |
| order_num        | string      | null: false                    |
| trucking_num     | string      |                                |
| shipment_company | string      |                                |
| user             | references  | null: false,foreign_key: true  |
| customer         | references  | null: false,foreign_key: true  |
| item             | references  | null: false,foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :customer
- has_one :ship_address
- has_many :comments
- has_many :order_items
- has_many :items, trough: :order_items

## orders_items テーブル

| Column     | Type        | Options                        |
| ---------- | ----------  | ------------------------------ |
| order      | references  | null: false,foreign_key: true  |
| item       | references  | null: false,foreign_key: true  |

### Association

- belongs_to :order
- belongs_to :item

## ship_address テーブル

| Column            | Type        | Options                        |
| ----------------  | ----------  | ------------------------------ |
| first_name        | string      | null: false                    |
| last_name         | string      | null: false                    |
| company           | string      |                                |
| tel               | string      | null: false                    |
| post_code         | string      | null: false                    |
| place_id          | integer     | null: false                    |
| city              | string      | null: false                    |    
| street_num        | string      | null: false                    |
| building          | string      |                                |
| memo              | text        |                                |  

### Association

- belongs_to :order

## comments テーブル

| Column     | Type        | Options                        |
| ---------- | ----------  | ------------------------------ |
| text       | text        |                                |
| user       | references  | null: false, foreign_key: true |
| order      | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order