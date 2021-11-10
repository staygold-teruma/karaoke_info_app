# カラオケ料金案内アプリ「iko!KARA」

![アプリトップ画面](https://user-images.githubusercontent.com/66634187/141078418-616b2f3e-eddc-4c18-8c3e-5224df09d1e8.png)

## 1. アプリ概要

カラオケ店の複雑な料金システムからお客様・スタッフを解放するためのアプリ。

## 2. 利用方法

- ユーザー側  
  「誰でもどこからでも」利用できる仕様のため、ユーザーログインを必要としません。  
  ※上記理由からゲストログイン機能は実装しておりません。  
  一方でマーケティングにも活用することを想定しており、必要なユーザー数の確保策として、ユーザー登録をすることで、限定クーポンが利用できる仕様としております。

- 店舗側  
  以下のページにアクセスしてください。  
  HTTP://shops_sign_in  
  Email : [example1@sample.com]  
  password : password1  
  店舗管理画面にて各料金やトピックスの登録や案内結果の分析ページを閲覧できます。  
  店舗に管理者ログインページの URL を開示する運用を想定しております。

## 3. 想定する利用シーン

- カラオケ利用前の料金確認(お客様のスマートフォン等)  
  (例) お客様 A:「カラオケ行かない？」 お客様 B:「いくらぐらいかかるか見てみるわ。」

- 混雑時の受付待ち時間に利用(店舗タブレット)  
  (例)スタッフ:「受付、少々お待ちください。お待ちの間にご利用プランや料金を確認いただけます。」

- 受付業務でのサポート(店舗タブレット)  
  複数の料金プランをスムーズにお客様に提示（電卓を用いた計算を廃止）

## 4. 開発の背景

**■ プログラミングのメリットを感じられるアプリを作りたい**

**【料金システムにおける課題解決】**  
カラオケ店の利用料金は、基本的に「平日/週末」「昼/夜」「一般/会員」「学生/シニア/一般」の組み合わせで決まり、ドリンクコースにおいても「ワンドリンク/ドリンクバー/アルコール飲み放題」など、非常にバリエーションが豊富です。  
これは顧客ニーズに応えるべく、様々な料金形態を創造してきた企業努力の結晶ですが、一方で、複雑になりすぎてしまったという側面があり、お客様には理解しづらく、店舗にとっても、料金説明に時間を要し、回転率が業績に直結する業態において、機会損失を招く完全なボトルネックとなっております。  
このようなサービスの発展で生じる複雑化という課題を解決することが、IT に求められる本質的な役割と考えました。

**【業界の構造的課題へのアプローチ】**  
飲食業界は、学生を中心としたアルバイトスタッフがサービスの最前線に立つ特殊な業界です。  
しかし、経験不足・人員不足も相まって、まだ必要なスキルを習得していないスタッフが、自身の習得度を超えた業務に従事せざるを得ないという構造的な課題があります。  
カラオケ店においては受付業務が上記に該当し、料金システムの複雑さに起因したトラブルが多発するため、それをどう回避するかという点にスタッフの意識は集中し、教育においてもこの部分に多くのリソースが割かれています。  
本アプリは、このような業界における構造的な課題に対しても、業務の難易度という障壁を軽減することで解決へ一助となります。  
また、「隙間バイト」など新しい働き方とのシナジーも高いことで、根本の人員不足という点にも貢献できると考えております。

**■「飲食業と IT 」に対する自身の考えを表現したい**

飲食業における AI 化や自動化はより急速に進むことが予想され、将来的には人がほとんど必要なくなるであろうと見られています。
この進化の過程で、店舗は少ない人員で営業活動ができるようになるという大きなメリットを享受しながらも、本質的な接客サービスのあり方や他店との差別化という問題に直面すると考えております。  
本アプリは、あくまで料金案内サポートとして位置付けし、IT で業務効率化やコストの削減を実現すると同時に、接客サービスと共存させ、生かしていけるアプリにしたいと考えました。

## 5. 特に見て欲しい点

■ サービスとして世に出せるものを

ポートフォリオとしてだけではなく、実際にリリースして運用していけるものを目指して開発を進めました。  
例えば 19 時で昼料金と夜料金が正しく切り替わるなど、ポートフォリオではあまり見られない部分に関しても、リアルに料金システムを再現しています。
また、ユーザーにスマホで利用してもらうことを最大の利用シーンと想定しているため、スマホサイズにおける UI/UX には注力いたしました。

■ リアルなレビューと改善

実際にカラオケ店の常連様や現場スタッフに何度も使用してもらい、相当数のレビューをいただきました。  
開発段階では気にならなかった使用感や機能の不備など、容赦のない指摘もいただきましたが、改善を繰り返し、それを積み重ねていく経験ができたことは、大きな財産になったと感じております。

## 6. 工夫した点

■ モデル設計

料金案内モデル(fee_guide モデル)が本アプリの最大の特徴と考えております。  
利用に煩わしさを感じさせないために入力フォームは必要最小限にして、各条件における複雑な計算はモデル側で処理して DB へ保存させています。また、直後に edit アクションへ移行することで、料金結果を表示すると同時に、続けて「条件を変えて再案内する」ことも可能にしています。  
参考文献がほとんどない状態でしたが、試行錯誤しながら実装したかった機能を実現できました。  
限られた知識や技術力の中で、創意工夫できることは自身の強みであると考えております。

■ 利用者に応じたコンセプト

- ユーザー側  
  「簡単な操作で明瞭に料金が分かること」  
  前述の通り、料金案内時に必要な項目は最小限かつ選択式にして、簡単で利便性が高いことを重視しました。  
  また、正確な料金が案内できることはもちろん、グループの総額だけでなく、1 名あたりの料金を表示するなど、実際にお客様からお問い合わせの多い内容をピックアップして、網羅できるよう表示内容を工夫しております。

- 店舗側  
  「業務効率化」  
  現場では、例えば料金の変更と同時にホームページの料金変更が必要になったりと、無駄な業務負担を強いられているケースが散見されます。  
  上記については料金更新と同時に料金表が更新されるように対策するなど、業務軽減になる細かい工夫を施しております。  
  各料金プランについては、どうしても一つ一つ登録していく必要がありますが、少しでも業務負担を軽減できるように、CSV インポートを利用して初期登録を行い、更新のみをしていくことを想定しています。今後、この機能を拡充して、さらにブラッシュアップしていく予定です。

## 7. 使用技術

- 言語：Ruby (3.0.0)
- フレームワーク：Ruby on Rails (6.1.3)
- フロントエンド：HTML/Scss/JavaScript/TailWindCSS
- DB：PostgreSQL
- インフラ：HEROKU
- ソースコード管理：GitHub

## 8. 機能一覧

**ユーザー機能**

- 料金案内機能
  - カレンダー機能(datepicker)
  - 店舗切り替え機能(jQuery)
  - 選択条件によって選択肢が動的に変化(jQuery)
- 新規登録、ログイン機能(devise)
- パンクズ機能(gretel)

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
