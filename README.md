# うぃずおけ。

## ■ サービス概要
カラオケに行った際に使える、
曲毎に適切なキーと採点が記録ができる
カラオケが好きな方におすすめできるサービスです。

## ■ ユーザーが抱える課題
  - 曲によって音域が変わるので適切なキーを見つけても、日を跨いでカラオケに行った際に覚えていなければ、キーを毎回探さなければならない。
  - 曲ごとの過去の点数と今回の点数を比較したい。

## ■ 課題に対する仮説
### ユーザーに合った適切なキーを思い出すことが難しい
  - 歌いやすいキーを見つけるのは手間がかかる。
  - キーの設定が曲によって違うため、ユーザーは自身が以前どのキーで歌ったのかを覚えるのが困難である。
  - 歌いやすかったキーを記録しておく手段がなく、同じ曲であってもキーを探さなければならない。
### 点数を記録することが難しい
  - JOYSOUNDなどのカラオケで提供されているユーザー機能では、履歴の上限や時間経過で消えてしまう。

## ■ 解決方法
### 曲毎に自身に合ったキーと採点を記録できるようにする
  - 曲毎にキーの値と採点を記録する機能を提供する。
  - 曲毎に設定したキーの値と記録した点数を見れるようにする。

## ■ メインのターゲットユーザー
  - ヒトカラが好きな人

## ■ 実装予定の機能（以下の例は実際のアプリの機能から一部省略しています）
- 未ログインユーザー
  - ユーザー登録機能
    - ユーザーがアカウントを作成することができる
  - パスワードリセット機能
    - パスワードを忘れてしまった際にメールアドレスを使用してパスワードを変更することができる
  - ログイン機能
    - 作成済みのアカウントでログインすることができる
- ログインユーザー
  - 設定機能
    - メールアドレスを変更することができる
  - 検索機能
    - ユーザーは曲名もしくはアーティスト名で検索することができる
  - プレビュー機能
    - 曲を30秒間再生することができる
  - リスト機能
    - リストは複数作ることができ、任意の名前にすることができる
      - ユーザーは任意の曲をキーの値を設定してリストに保存することができる
      - リストから保存した曲とその曲に設定したキーの値を見ることができる
      - リストから見えるキーの値はいつでも変更することができる
  - ソート機能
    - リスト内でアーティスト名・曲名でソートすることができる
  - 採点機能
    - ユーザーはカラオケの点数と歌った際のキーの値を記録することができる
    - ユーザーが記録した点数を、これまでの自分の点数と比較することができる

## ■ なぜこのサービスを作りたいのか？
私自身一時期カラオケにハマり、ひとりでもよくカラオケに行っていました。<br>
私は音域が狭いので歌う際にこの曲はどれぐらいキー調整すればいいのだろう？と歌いながら調整して適切なキーを見つけるのですが、日を跨ぐと適切なキーを忘れてしまいます。<br>
カラオケではいろいろな歌を歌うため、この曲はこれで〜と、覚えることが難しいです。<br>
そのような悩みを解決し、また、作成後も作成者自身が使い続けることで改善が続けられると思い、このサービスを作ることを決意しました。<br>

## ■ 技術選定
  - Rails7
  - postgresql
  - JavaScript
  - Bootstrap
  - heroku
  - iTunesAPI
  - Hotwire
  - オートコンプリート

## ■ 画面遷移図
https://www.figma.com/file/MugoDGk0JoynUdN0M2wj1I/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?type=design&node-id=0%3A1&t=4abRRLbePPzwT1MC-1

## ■ ER図![ER with_oke](https://github.com/y3leNq/with_oke/assets/117088006/ab9147a7-5e24-458c-b858-9ff46330c1bb)
