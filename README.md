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

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| nickname           | string | null: false                |
| email              | string | null: false , unique: true |
| encrypted_password | string | null: false                |

## association
- has_many :pictures
- has_many :comments

## picture テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| text               | text   | null: false                |
| image              | string | null: false , unique: true |

## association
- belongs_to :user
- has_many :comments

## comments テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| comments        | string | null: false |

# association
- belongs_to :user
- belongs_to :picture