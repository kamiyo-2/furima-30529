

# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| email             | string | null: false |
| password          | string | null: false |
| nickname          | string | null: false |
| first_name        | string | null: false |
| last_name         | string | null: false |
| first_name_kana   | string | null: false |
| last_name_kana    | string | null: false |
| birthday          | integer| null: false |

### Association

- has_many :Product
- has_many :address
- has=one  :Credit_caredsa



## Product テーブル

| Column     | Type         | ----------------------------- |
| ---------- | ------------ | ----------------------------- |
| name       | string       | null: false                   |
| description| text         | null: false                   |
| category   | text         | null: false                   |
| status     | text         | null: false                   |
| burde      | text         | null: false                   |
| area       | text         | null: false                   |
| days       | text         | null: false                   |
| price      | text         | null: false                   |
| image      | ActiveStorage|                               |
| user       | references   | null: false, foreign_key:true |         


### Association

- belongs_to :user
- has_one_attached :image


## Credit_caredsaテーブル 

| Column            | Type      | ----------- | 
| ----------------- | --------- | ----------- |
| card_company      | string    | null: false |                  
| card_number       | string    | null: false |                  
| card_year         | integer   | null: false |                  
| card_month        | integer   | null: false |                  
| card_pass         | integer   | null: false |                  
| customer_id       | string    | null: false |                  
| card_id           | string    | null: false |                  
| user              | references| null: false |


### Association

- belongs_to :user




## addressテーブル 

| Column            | Type      | ------------------------------ |
| ----------------- | --------- | ------------------------------ |
| post_code         | string    | null: false                    |
| prefectures_id    | integer   | null: false, foreign_key:true  |
| city              | string    | null: false                    |
| building_name     | string    |                                |
| phone_number      | string    | null: false, uniqueness:true   |          
| purchase          | references| null: false, foreign_key: true |     


### Association

- belongs_to :user