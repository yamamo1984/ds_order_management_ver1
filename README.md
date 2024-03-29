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
| ship_address      | references  | null: false,foreign_key: true  | 

### Association

- has_many :ship_addresses
- has_many :orders


## items テーブル

| Column            | Type        | Options                        |
| ----------------- | ----------  | -------------------------------|
| code              | string      | null: false                    |
| name              | string      | null: false                    |
| price             | integer     | null: false                    |
| color             | string      |                                |
| size              | string      |                                |
| stock_num         | integer     | null: false                    |
| memo              | text        |                                |


### Association

- has_many :order_items
- has_many :orders, trough: :order_items

## orders テーブル

| Column           | Type        | Options                        |
| ---------------- | ----------  | ------------------------------ |
| order_num        | string      | null: false,unique: true       |
| shipment_company | integer     | null: false                    |
| price            | integer     | null: false                    |
| purchase_num     | integer     | null: false                    |
| user             | references  | null: false,foreign_key: true  |
| customer         | references  | null: false,foreign_key: true  |
| item             | references  | null: false,foreign_key: true  |
| trucking_num     | references  | null: false,foreign_key: true  |
| ship_address     | references  | null: false,foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :customer
- belongs_to :ship_address
- has_many :comments
- has_many :order_items
- has_many :items, trough: :order_items

## order_items テーブル

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
| num               | integer     | null: false                    |
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
| customer          | references  | null: false,foreign_key: true  | 
| order             | references  | null: false,foreign_key: true  | 

### Association
- belongs_to :customer
- has_many :orders

## trucking_num テーブル

| Column     | Type        | Options                        |
| ---------- | ----------  | ------------------------------ |
| num        | text        | null: false, unique: true      |
| order      | references  | null: false, foreign_key: true |

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
