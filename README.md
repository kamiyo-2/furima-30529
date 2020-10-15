

# テーブル設計

## users テーブル

| Column            | Type         | Options                       |
| ----------------- | ------------ | ----------------------------- |
| email             | string       | null: false                   |
| encrypted_password| string       | null: false                   |
| nickname          | string       | null: false                   |
| first_name        | string       | null: false                   |
| last_name         | string       | null: false                   |
| first_name_kana   | string       | null: false                   |
| last_name_kana    | string       | null: false                   |
| birthday          | date         | null: false                   |
| purchase          | references   | null: false, foreign_key:true |  

### Association

- has_many :Product
- has_many :address
- has-many :purchase



## Product テーブル

| Column     | Type         | ----------------------------- |
| ---------- | ------------ | ----------------------------- |
| name       | string       | null: false                   |
| description| text         | null: false                   |
| category_id| text         | null: false                   |
| status_id  | text         | null: false                   |
| burde_id   | text         | null: false                   |
| area_id    | text         | null: false                   |
| days_id    | text         | null: false                   |
| price      | integer      | null: false                   |
| user       | references   | null: false, foreign_key:true | 
| purchase   | references   | null: false, foreign_key:true |          


### Association

- belongs_to :user
- has-one  :purchase
- has_one_attached :image




## Street_addressテーブル 

| Column            | Type      | ------------------------------ |
| ----------------- | --------- | ------------------------------ |
| post_code         | string    | null: false                    |
| prefectures_id    | integer   | null: false                    |
| city              | string    | null: false                    |
| address           | string    | null: false                    |
| building_name     | string    |                                |
| phone_number      | string    | null: false                    |          
| purchase          | references| null: false, foreign_key: true |     


### Association

- belongs_to :user



## purchase  テーブル

| Column     | Type         | ----------------------------- |
| ---------- | ------------ | ----------------------------- |
| user       | references   | null: false, foreign_key:true |  
| product    | references   | null: false, foreign_key:true |   

### Association

- belongs_to :user
- belongs_to :product
