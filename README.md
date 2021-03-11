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

| Column          | Type       | Options                         |
| --------        | ------     | ------------------------------- |
| name            | string     | null: false                     |
| text            | text       | null: false                     |
| category_id     | integer    | null: false                     |
| status_id       | integer    | null: false                     |
| paymentmethod_id| integer    | null: false                     |
| prefecture_id   | integer    | null: false                     |
| delivery_id     | integer    | null: false                     |
| price           | integer    | null: false                     |
| user            | references | null: false , foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## ordersテーブル

| Column       | Type       | Options                         |
| --------     | ------     | ------------------------------- |
| postalcode   | string     | null: false ,default: ""        |
| prefecture_id| integer    | null: false ,default: ""        |
| city         | string     | null: false ,default: ""        |
| address      | string     | null: false ,default: ""        |
| building     | string     | default: ""                     |
| phoneno      | string     | null: false ,default: ""        |
| item         | references | null: false , foreign_key: true | 
| user         | references | null: false , foreign_key: true |


### Association
- has_one :purchase

### purchasesテーブル

| Column       | Type       | Options                         |
| --------     | ------     | ------------------------------- |
| item         | references | null: false , foreign_key: true | 
| user         | references | null: false , foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address