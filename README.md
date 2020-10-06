### アプリケーション名	 Yuruzen

## アプリケーション概要	
東洋医学に基づいた食材選びが身近な食材で簡単にできる。

## URL	
https://yuruzen-29813.herokuapp.com/



## テスト用アカウント	        （後で記入）
ログイン機能等を実装した場合は、記述しましょう。またBasic認証等を設けている場合は、そのID/Passも記述しましょう。



## 利用方法	
自分の体質と今日の体の調子から自分にあった食材を検索する

## 目指した課題解決	
このアプリケーションを通じて、正しい食材選びができるようになり、健康を手に入れる。

## 洗い出した要件
# ログイン/新規登録ページ
1.ボタン
*ユーザーページへ遷移できるボタンがある
2.表示
*サインイン/ログインの入力フォームがある

# ユーザーページ
1.ボタン
*基本体質を選択できるボタンがある
*検索ページ（本日の体調）に遷移できるボタンがある
2.表示
*ヘッダーにユーザー名が表示される
*自分の体質を見ることができる
*お気に入り登録した食材一覧を見ることができる

# 検索ページ(本日の体調)
1.ボタン
*複数検索ができるボタンがある
*ユーザーページへ遷移できるボタンがある
*検索した食材の詳細へ遷移できるボタンがある
2.表示
*ヘッダーにユーザー名が表示される
*複数検索ができるボタンが表示される
*検索結果一覧が表示される

# 詳細ページ（食材の詳細）
1.ボタン
*ユーザーページへ遷移できるボタンがある
*検索ページ（本日の体調）に遷移できるボタンがある
*お気に入りボタンがある
2.表示
*食材の詳細（効能）が表示される
*お気に入りボタンが表示される


# 実装した機能についてのGIFと説明	
実装した機能について、それぞれどのような特徴があるのか列挙しましょう。GIFを添えることで、イメージがしやすくなります。


# 実装予定の機能	
洗い出した要件の中から、今後実装予定のものがあれば記述しましょう。


# データベース設計	
ER図 https://app.lucidchart.com/documents/edit/4d3b3829-05db-469d-9459-2d894a0a7177/0_0#?folder_id=home&browser=icon


# ローカルでの動作方法	
git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど
ruby _6.0.0_ 
mysql2


 # テーブル設計

 ## users テーブル

| Column          | Type    | Options     |
| --------------  | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| family_name     | string  | null: false |
| first_name      | string  | null: false |
| password        | string  | null: false |
| constitution_id | integer | null: false |

### Association

- has_many :symptoms
- has_many :foods, through: :favorites

## symptoms テーブル

| Column     | Type       | Options                        |
| ---------  | ---------- | ------------------------------ |
| condition  | string     | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

 - belongs_to :user
 - has_many :foods, through: :symptoms_foods

 ##  foods テーブル

| Column     | Type       | Options                        |
| ---------  | ---------- | ------------------------------ |
| food_name  | string     | null: false                    |
| image      | string     | null: false                    |
| text       | text       | null: false                    |
| effect     | string     | null: false                    |

### Association

-has_many :symptoms, through: :symptoms_foods
-has_many :users, through: :favorites

## symptoms_foods テーブル（中間テーブル）

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| condition_id  | references | null: false, foreign_key: true |
| food_id       | references | null: false, foreign_key: true |

### Association

-belongs_to :symptom
-belongs_to :food

## favorites テーブル（中間テーブル）

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| food_id       | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :food

