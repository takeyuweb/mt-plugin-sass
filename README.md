# Sass
* Author:: Yuichi Takeuchi <uzuki05@takeyu-web.com>
* Website:: http://takeyu-web.com/
* Copyright:: Copyright 2011 Yuichi Takeuchi
* License:: GPL v2

MovableType(MTOS)5のスタイルシートをSass及びSassy CSS(SCSS)で記述できるようにするプラグインです

Sass 及び SCSS については以下のページをお読み下さい。

http://sass-lang.com/


## 動作環境

- MovableType (MTOS) 5
- ダイナミックパブリッシングが動作する環境（PHP）
- mod_rewrite 有効
- Ruby 1.8.7 以上（Sass/SCCSのコンパイルに必要です）


## インストール

1. Sassプラグインをpluginsにアップロード。
2. [システム]->[ツール]->[プラグイン] より Sassプラグインの設定を開き、以下の項目を設定。
  - [Ruby Interpreter] rubyの実行パスを指定。（例：`/usr/local/bin/ruby`）
3. Sass/SCSSを使用したいウェブサイトまたはブログのプラグイン設定を開き、[テンプレートのインストール]をクリック。
4. テンプレートに「Sass .htaccess」「Sass compiler」の2つのインデックステンプレートがインストールされたことを確認します。
5. スタイルシートのインデックステンプレートを開き、出力ファイル名の拡張子を「.scss」に変更。
6. 再構築。


## しくみ

1. `mod_rewrite`により、`*.scss`及び`*.sass`へのアクセスがあった際に、`.sass.php`へ処理を移します。
2. `.sass.php`により該当のscss/sassファイルをコンパイルして表示
  - ロードパスは標準でテンプレートをインストールしたウェブサイト/ブログのルートになります。（設定より変更可能）


## 同梱のライブラリについて
依存の機能のうち再配布が許可されているものについて、`vendor`内に同梱しています。


### Sass
http://sass-lang.com/

Hampton Catlin, Nathan Weizenbaum, Chris Eppstein, and numerous contributors. It is available for use and modification under the MIT license.


## ご注意
* 無保証です。このプラグインを使用したことでいかなる損害が発生しても、制作者は一切責任を負いません。
* すべての携帯電話などから正しく投稿できることを保証するものではありません。そもそもきちんと動くことも保証しません。
