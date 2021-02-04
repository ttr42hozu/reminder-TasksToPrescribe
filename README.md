# reminder-TasksToPrescribe
継続されている処方薬を管理し、次回処方日がきたらページに表示することで教えてくれるアプリケーション

# 概要

# App URL

# テスト用アカウント

# 利用方法

# 課題解決

# 要件定義

# 機能一覧

# 実装予定機能

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
