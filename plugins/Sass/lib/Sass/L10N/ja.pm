package Sass::L10N::ja;

use strict;
use warnings;

use utf8;

use base 'Sass::L10N::en_us';
use vars qw( %Lexicon );

%Lexicon = (
    '_PLUGIN_DESCRIPTION' => 'Sass及びSassyCSS(SCSS)を利用できるようにします。（要Ruby,mod_rewrite）',
    'Installed sass templates.' => 'テンプレートのインストール',
    'Completed the installation of the template.' => 'テンプレートのインストールを完了しました。',
    'Installed template override does not do, for initialization, please try again once deleted.' => 'インストール済みのテンプレートの上書きは行いませんので、初期化の場合は一度削除して再度お試し下さい。',
    'Install Templates.' => 'テンプレートのインストール',
    "Install 'Sass compiler' and 'Sass .htaccess' Index Templates.(required)" => "インデックステンプレート「Sass compiler」「Sass .htaccess」をブログ（ウェブサイト）にインストールします。（必須）",
    "Additional search directories.(default:BlogSitePath)" => '追加の検索パス。空白の場合、ブログ（ウェブサイト）パスを使用します。詳しくは<a href="http://sass-lang.com/docs/yardoc/file.SASS_REFERENCE.html#import">Sassのドキュメント</a>をお読み下さい。',
);

1;
