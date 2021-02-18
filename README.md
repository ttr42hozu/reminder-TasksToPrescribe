# reminder-TasksToPrescribe
継続されている処方薬を管理し、次回処方日がきたらページに表示することで教えてくれるアプリケーション

# 概要

# App URL
https://reminder-taskstoprescribe.herokuapp.com/
# テスト用アカウント
Email　test@example1

password　test1test1
# 利用方法
処方情報登録ページにて、患者とその処方情報を登録することで、処方日になったらトップページに表示することでユーザーに教えてくれます。
また、表示された処方情報の用意ができたら、「用意完了ボタン」を押すことで、用意済みのものは分けて表示することができます。
用意済みの処方情報が、次回以降も継続して処方される場合は、「継続ボタン」を押すことで、次回処方日になったとき、自動で表示させます。
処方が今回で終了の場合は「終了ボタン」を押してもらうことで、処方情報を削除します。（次回以降は表示されない）

# データベース設計
## users テーブル

| Column             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association
has_many :patients
has_many :preparations

## patients テーブル

| Column                | Type       | Option                |
| --------------------- | ---------- | --------------------- |
| medical_record_number | string     | null: false           |
| last_name             | string     | null: false           |
| first_name            | string     | null: false           |
| start_day             | date       | null: false           |
| user                  | references | foreign_key: true     |

### Association
belongs_to :user
has_many :medicines

## medicines テーブル

| Column                   | Type   | Option   |
| ------------------------ | ------ | -------- |
| name        | string     | null: false       |
| usage_id    | integer    | null: false       |
| dose_id     | integer    | null: false       |
| day_id      | integer    | null: false       |
| patient     | references | foreign_key: true |

### Association
belongs_to :patient
has_one :preparation

## preparations テーブル

| Column     | Type       | Option            |
| ---------- | ---------- | ----------------- |
| user       | references | foreign_key: true |
| medicine   | references | foreign_key: true |

### Association
belongs_to :medicines
belongs_to :user

# ローカルでの動作方法
