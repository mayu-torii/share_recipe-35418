# README

## users テーブル

| Column     | Type   | Options     |
| -----------| ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| profile    | text   | null: false |

## Association
- has_many :recipes
- has_many :comments



## commentsテーブル

| Column    | Type       | Options                        |
| ----------| ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| recipes   | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :recipe



## recipesテーブル

| Column            | Type       | Options                        |
| ------------------| ---------- | ------------------------------ |
| title             | string     | null: false                    |
| description       | text       | null: false                    |
| user              | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- has_many :comments