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