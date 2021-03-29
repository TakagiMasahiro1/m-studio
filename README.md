- ##アプリケーション名    :M-Studio
- ##アプリケーション概要  :イラスト投稿機能
- ##URL                :https://m-studio.herokuapp.com/
- ##利用方法            :ログイン/ログアウト/画像投稿/投稿削除/投稿編集/コメント
- ##目指した課題         :漫画の原作者と作画のマッチング
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
| account            | string | null: false                |

## association
- belongs_to :user
- has_many :comments

## comments テーブル

| Column   | Type       | Options                       |
| -------- | ---------- | ----------------------------- |
| comments | string     | null: false                   |
| picture  | references | null: false foreign_key: true |
| user     | references | null: false foreign_key: true |

# association
- belongs_to :user
- belongs_to :picture
