# README

# furimaのER図

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |

### Association
- has_many : items
- has_many : orders

## items テーブル
| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| image              |           | null: false                    |
| product            | string    | null: false                    |
| category           | string    | null: false                    |
| status             | string    | null: false                    |
| price              | integer   | null: false                    |
| delivery_change    | integer   | null: false                    |
| shipping_area      | string    | null: false                    |
| delivery_time      | integer   | null: false                    |
| user               | reference | null: false, foreign_key: true |

### Association
- belongs_to : user
- has_one : order 

## orders テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| buyer              | string     | null: false                    |
| purchased          | string     | null: false                    |
| item               | reference  | null: false, foreign_key: true |

### Association
- belongs_to : user
- belongs_to : item
- has_one :destination

# destinations テーブル
| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| zip                | varchar(7) | null: false |
| pref               |            | null: false |
| city               | text       | null: false |
| block              | text       | null: false |
| building           | text       |             |
| phone_number       | varchar(11)| null: false |

### Association
- belongs_to : order