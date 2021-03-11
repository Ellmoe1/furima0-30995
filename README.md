＃テーブル設計
## users テーブル

| Column             |  Type    |  Options                               |
| --------           |  ------  |  -----------                           |
| nickname           |  string  |  null: false ,default: ""              |
| email              |  string  |  null: false ,unique: true ,default: ""|
| encrypted_password |  string  |  null: false ,default: ""              |
| lastname           |  string  |  null: false ,default: ""              |
| firstname          |  string  |  null: false ,default: ""              |
| lastnamekana       |  string  |  null: false ,default: ""              |
| firstnamekana      |  string  |  null: false ,default: ""              |
| birthdate          |  date    |  null: false                           |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column       | Type       | Options                         |
| --------     | ------     | ------------------------------- |
| name         | string     | null: false                     |
| text         | text       | null: false                     |
| category     | integer    | null: false                     |
| status       | integer    | null: false                     |
| paymentmethod| integer    | null: false                     |
| prefecture   | integer    | null: false                     |
| delivery     | integer    | null: false                     |
| price        | integer    | null: false                     |
| user         | references | null: false , foreign_key: true |

### Association

- belongs_to :user
- has_one  :order
- has_one :purchase

## ordersテーブル

| Column       | Type       | Options                         |
| --------     | ------     | ------------------------------- |
| postalcode   | string     | null: false ,default: ""        |
| prefecture   | integer    | null: false ,default: ""        |
| city         | string     | null: false ,default: ""        |
| address      | string     | null: false ,default: ""        |
| building     | string     | default: ""                     |
| phoneno      | string     | null: false ,default: ""        |

### Association

- has_many :items
- belongs_to :user

### purchasesテーブル

| Column       | Type       | Options                         |
| --------     | ------     | ------------------------------- |
| item         | references | null: false , foreign_key: true | 
| user         | references | null: false , foreign_key: true |
| address      | string     | null: false , default: ""       |

### Association

- belongs_to :item
- belongs_to :user
