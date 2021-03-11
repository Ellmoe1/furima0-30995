＃テーブル設計
## users テーブル

| Column             |  Type    |  Options                  |
| --------           |  ------  |  -----------              |
| nickname           |  string  |  null: false ,default: "" |
| email              |  string  |  null: false ,default: "" |
| encrypted_password |  string  |  null: false ,default: "" |
| lastname           |  string  |  null: false ,default: "" |
| firstname          |  string  |  null: false ,default: "" |
| lastnamekana       |  string  |  null: false ,default: "" |
| firstnamekana      |  string  |  null: false ,default: "" |
| birthdate          |  date    |  null: false              |

### Association

- has_many: items
- has_many: orders

## itemsテーブル

| Column       | Type       | Options                         |
| --------     | ------     | ------------------------------- |
| name         | string     | null: false                     |
| text         | string     | null: false                     |
| category     | string     | null: false                     |
| status       | string     | null: false                     |
| paymentmethod| string     | null: false                     |
| prefecture   | string     | null: false                     |
| delivery     | string     | null: false                     |
| price        | integer    | null: false                     |
| user         | references | null: false , foreign_key: true |

### Association

- belongs_to: user
- has_one: order

## ordersテーブル

| Column       | Type       | Options                         |
| --------     | ------     | ------------------------------- |
| cardno       | string     | null: false ,default: ""        |
| expmonth     | string     | null: false ,default: ""        |
| expyear      | string     | null: false ,default: ""        |
| cardcvc      | string     | null: false ,default: ""        |
| postalcode   | string     | null: false ,default: ""        |
| prefecture   | string     | null: false ,default: ""        |
| city         | string     | null: false ,default: ""        |
| address      | string     | null: false ,default: ""        |
| building     | string     | null: false ,default: ""        |
| phoneno      | string     | null: false ,default: ""        |
| item         | references | null: false , foreign_key: true | 
| user         | references | null: false , foreign_key: true |

### Association

- has_many :items
- belongs_to :user
