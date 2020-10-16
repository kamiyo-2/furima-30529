

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

### Association

- has_many :items
- has-many :purchases



## items テーブル

| Column     | Type         | ----------------------------- |
| ---------- | ------------ | ----------------------------- |
| name       | string       | null: false                   |
| description| text         | null: false                   |
| category_id| integer      | null: false                   |
| status_id  | integer      | null: false                   |
| burde_id   | integer      | null: false                   |
| area_id    | integer      | null: false                   |
| days_id    | integer      | null: false                   |
| price      | integer      | null: false                   |
| user       | references   | null: false, foreign_key:true | 
        


### Association

- belongs_to :user
- has_one  :purchase
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

- belongs_to :purchase



## purchase  テーブル

| Column     | Type         | ----------------------------- |
| ---------- | ------------ | ----------------------------- |
| user       | references   | null: false, foreign_key:true |  
| item       | references   | null: false, foreign_key:true |   

### Association

- belongs_to :user
- belongs_to :item
- has_one    :street_address