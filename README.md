# <img src="https://user-images.githubusercontent.com/66634187/152946238-07d7dcc7-b674-4ff0-bd43-b6572e79ea01.png" width="80"> カラオケ料金案内アプリ「iko!KARA」

## 1. アプリ概要

「カラオケの料金システムは分かってないけど、とりあえず利用している」  
「会計をしてみたら思っていた金額ではなかった」  
こんな経験はありませんか？

<br>

### 本アプリは、

**カラオケ店の複雑な料金システムからお客様・スタッフを解放するためのアプリです。**

<br>

開発にあたり、以下を想定しております

- 顧客サービスの一環としたカラオケチェーンからの受託開発
- 各社の料金プランを確認・比較できる独自のサービス開発

<br>
<br>
<h3>■料金案内機能</h3>
<br>

<p>
  <img src="https://user-images.githubusercontent.com/66634187/141084040-cb669b0d-4311-4a61-aefe-fa4885584209.png" width="200">　　　　<img src="https://user-images.githubusercontent.com/66634187/141700009-7388ef04-feda-4d33-8b71-042ae9876e9a.gif" width="200">
</p>

<br>

## 2. 利用方法

**● ユーザー側**  
「誰でもどこからでも」利用できる仕様のため、ユーザーログインは必要ありません。  
※上記理由からゲストログイン機能は実装しておりません。

一方でマーケティングにも活用できるよう、必要なユーザー数の確保策として、ユーザー登録をすることで、限定クーポンが利用できる仕様としております。

**● 店舗側**  
 以下のページにアクセスしてください。  
 HTTP://shops_sign_in  
 Email : [example1@sample.com]  
 password : password1

店舗管理画面にて各料金やトピックスの登録や案内結果の分析ページを閲覧できます。  
 店舗に管理者ログインページの URL を開示する運用を想定しております。

<br>

## 3. 想定する利用シーン

- カラオケ利用前の料金確認(お客様のスマートフォン等)  
  (例) お客様 A:「カラオケ行かない？」 お客様 B:「いくらぐらいかかるか見てみるわ。」

- 混雑時の受付待ち時間に利用(店舗タブレット)  
  (例)スタッフ:「受付、少々お待ちください。お待ちの間にご利用プランや料金を確認いただけます。」

- 受付業務でのサポート(店舗タブレット)  
  複数の料金プランをスムーズにお客様に提示（電卓を用いた計算を廃止）

<br>

## 4. 開発の背景

カラオケ店の料金が複雑化していることによるデメリットを解消することで、ユーザー・店舗、双方の問題を解決できるのではないかという発想が開発のきっかけです。  
また、カラオケ店のみならず、飲食業界は深刻な人手不足という問題も抱えており、本サービスにおいて、それらの課題を解決することができれば、多方面で需要があるサービスを開発できるのではないかと考えました。

<br>

### 【料金システムにおける課題】

<br>

| 対象     | 現象                 | 影響                                                                                              |
| -------- | -------------------- | ------------------------------------------------------------------------------------------------- |
| ユーザー | 料金を理解しにくい   | 利用前に利用金額を把握できない<br>複数店舗の料金比較ができない                                    |
| 店舗     | 料金説明が難しい     | 料金トラブルが非常に多い<br>料金説明に時間を要して回転率に影響<br> 受付担当者の教育コストがかかる |
| 店舗     | 顧客ニーズに応えたい | 料金システムのバリエーションは減らさず、<br>維持・増加させることでより複雑に                      |

<br>

➡️ **本アプリによって、時間・場所を問わず、料金検索・料金説明が簡単にできます**

- ユーザー側
  - 利用前の料金確認ができる
  - 事前に様々な店舗の料金比較ができる
- 店舗側
  - 受付業務の負担軽減
  - スムーズな案内による回転率の向上
  - 料金トラブルの減少

<br>

### 【人手不足という業界の構造的課題】

<br>

| 現象                                                      | 影響                                                   |
| --------------------------------------------------------- | ------------------------------------------------------ |
| 社員 1 名＋アルバイトでの運営で<br>成り立つビジネスモデル | 経験・スキル不足のスタッフが大半                       |
| 離職率が高い<br>学生従業員が多い                          | 受付業務のハードルが高い<br>教育コストが無駄になりがち |

<br>

➡️ **本アプリによって現場負担を軽減できます**

- 料金システム・受付スキルの習得に必要なスキルハードルを軽減
- 従業員教育コストの削減
- 隙間バイトなど、新しい働き方とのシナジー効果

<br>

## 5. 特に見て欲しい点

<br>

**■ 実運用を強く意識**  
ポートフォリオとしてだけではなく、実際に企業の営業活動で運用していけるものを目指して開発を進めました。  
実際の料金システムを知らないと正しいか判断できない部分についても、案内した料金に誤りがないようにリアルに再現しております。
ここはポートフォリオとしてはあまり見られない部分という認識ですが、実運用を意識してこだわって開発を進めております。

<br>

**■ スマホサイズでの UI/UX**  
ユーザーにスマホで利用してもらうことを最大の利用シーンと想定しているため、スマホサイズにおける UI/UX には注力いたしました。

<br>

**■ リアルなレビューと改善**  
実際にカラオケ店の常連様や現場スタッフに何度も使用してもらい、相当数のレビューをいただきました。  
開発段階では気にならなかった使用感や機能の不備など、容赦のない指摘もいただきましたが、改善を繰り返し、それを積み重ねていく経験ができたことは、大きな財産になったと感じております。

<br>

## 6. 工夫した点

<br>

**■ モデル設計**

料金案内モデル(**fee_guide モデル**)が本アプリの最大の特徴と考えております。

利用に煩わしさを感じさせないために入力フォームは必要最小限にして、各条件における複雑な計算はモデル側で処理して DB へ保存させています。また、直後に edit アクションへ移行することで、料金結果を表示すると同時に、続けて「条件を変えて再案内する」ことも可能にしています。  
参考文献がほとんどない状態でしたが、試行錯誤しながら実装したかった機能を実現できました。

限られた知識や技術力の中で、創意工夫できることは自身の強みであると考えております。

<br>

**■ 利用者に応じたコンセプト**
<br>

● ユーザー側

**「簡単な操作で明瞭に料金が分かること」**

1.  料金案内フォームは全て選択式にして、煩わしさを感じにくいよう工夫

2.  料金総額以外にも、問い合わせの多い内容をピックアップ して結果表示  
    ※ 1 名あたりの料金  
    ※ 会員/非会員、学生/シニアなどの区分ごとの料金

<br>

● 店舗側

**「不要な作業を軽減して業務を効率化すること」**

1. 料金プラン変更(更新)と同時に料金表の表示を切り替え  
   ※ 現場では料金更新作業 + ホームページ等の修正を行なっている

2. CSV インポート機能を用いて、初回の料金プランを登録  
   ※ 料金変更があった場合のみ更新する運用が可能

3. 案内結果の表示と同時に条件を変えた料金案内を実行可能  
   ※ 複数のプランをスムーズに提案可能

<br>

## 7. 使用技術

- 言語：Ruby (2.7.3)
- フレームワーク：Ruby on Rails (6.1.4)
- フロントエンド：HTML/Scss/JavaScript/TailWindCSS
- DB：PostgreSQL
- インフラ：HEROKU
- ソースコード管理：GitHub

<br>

## 8. 機能一覧

**ユーザー機能**

- 料金案内機能
  - カレンダー機能(datepicker)
  - 店舗切り替え機能(jQuery)
  - 選択条件によって選択肢が動的に変化(jQuery)
- 新規登録、ログイン機能(devise)
- パンクズリスト(gretel)

**店舗機能**

- 料金・トピックスの作成・編集・削除機能
  - 画像投稿機能(carrierwave)
  - 料金検索機能(ransack)
  - ページネーション機能(kaminari)
  - CSV インポート機能
- 新規登録、ログイン機能(devise)
  - 郵便番号の入力による住所の自動入力(jpostal)
- 案内結果の分析機能
  - グラフ表示(chartkick)

**その他**

- トピックスページのユーザー・店舗のビューの切り分け
