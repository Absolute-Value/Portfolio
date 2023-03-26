---
title: "Jekyll ホームページ 個人的メモ"
date: "2022-07-01 12:00:00"
update: "2023-03-19 23:00:00"
category: "Note"
hero: http://jekyllrb-ja.github.io/img/logo-2x.png
tags: ["Memo", "Jekyll"]
layout: note
excerpt: Jekyll関連で役に立ちそうな個人的メモです。
toc: true
---

# はじめに

Jekyll関連で役に立ちそうな個人的メモです。

<!--more-->

[インストール関連はコチラ]({{ 'notes/Jekyll-Install' | relative_url }})

# Jekyllの新規作成

```console
$ jekyll new <name>
```  
{name}は任意のプロジェクト名

# Jekyllの起動

ローカルでサーバーを立ち上げる時  
```console
$ jekyll server
```

サイトをプロダクションとして生成する時  
```console
$ jekyll build
```

起動後のURL：[http://127.0.0.1:4000/](http://127.0.0.1:4000/)

# Githubへの投稿方法

_siteディレクトリへ移動する  

```console
$ cd _site
```

いつものgit操作  

```console
$ git add .
$ git commit -m "Comment"
$ git push
```

## Git操作の自動化をするbashファイル
元のプロジェクトとサイト用のプロジェクトに対してgit操作するの面倒だったので自動化するbashを作成しました

git.sh
<script src="https://gist.github.com/Absolute-Value/96b0dfabffcde15528c82eef9135ec4b.js"></script>

引数にコミットメッセージ入れれます

# Markdown記法
## インラインコード
\`で囲む (Shift + @)
## コード
\`\`\`で囲む

# Postsのページの作成
参考：[sverrirs/jekyll-paginate-v2](https://github.com/sverrirs/jekyll-paginate-v2)

## Jekyll:Paginate V2をダウンロード
gemfileを作成
```console
bundle init
```

gemfileを編集
```console
vim gemfile
```
以下を追加する
```ruby
group :jekyll_plugins do
  gem "jekyll-paginate-v2"
  gem "jekyll-feed"
end
```

一括インストール
```console
bundle install
```
参考：[理解必須！gemsのインストール方法とインストール場所](https://www.sejuku.net/blog/19603)

## _config.ymlを編集
_config.ymlに以下を追加する
```yml
gems:
  - jekyll-paginate-v2
# Pagination Settings
pagination:
  enabled: true
  per_page: 8 # 一つのページに表示するPostの数
  permalink: '/:num/'
  title: ' Title - :num'
  limit: 0
  sort_field: 'date'
  sort_reverse: true
```

## 表示させたいページのmarkdownの編集
表示させたいページのマークダウンの頭に以下を追加
```markdown
---
permalink: '/link/' # ページのURL末尾を設定してください
pagination:
  enabled: true
---
```

## 表示させたいページのhtmlの編集
表示させたいページのhtmlを[コチラ](https://github.com/sverrirs/jekyll-paginate-v2/blob/master/examples/01-typicalblog/_layouts/home.html)を参考に記述  
ここにコードを載せると誤認識するので無理でした...

# 目次の作成

参考：[toshimaru/jekyll-toc](https://github.com/toshimaru/jekyll-toc)

## jekyll-tocをダウンロード
Gemfileに以下を追加する

```ruby
gem 'jekyll-toc'
```

インストール
```console
bundle install
```

## _config.ymlを編集
_config.ymlに以下を追加する
```yml
gems:
  - jekyll-toc
```

## 表示させたいページのmarkdownの編集
表示させたいページのマークダウンの頭に以下を追加
```markdown
---
toc: true
---
```
## 表示させたいページのhtmlの編集

html内の目次を追加したい箇所に
```html
{ { content | toc_only } }
```
を追加（中括弧はくっつけてください）

## CSSの変更

```css
.section-nav {
  background-color: #e8e8e8;
  margin: 0px 5%;
  padding: 15px 1%;
  border: 0px solid #e8e8e8;
  border-radius: 3px;
}
```

## その他の設定

_config.ymlを編集
```yml
toc:
  min_level: 1
  max_level: 6
  ordered_list: false
  no_toc_section_class: no_toc_section
  list_id: toc
  list_class: section-nav
  sublist_class: ''
  item_class: toc-entry
  item_prefix: toc-
```

# サイトマップの作成

## jekyll-tocをダウンロード
Gemfileに以下を追加する

```ruby
gem 'jekyll-sitemap'
```

インストール
```console
bundle install
```

## _config.ymlを編集
_config.ymlに以下を追加する

```yml
gems:
  - jekyll-sitemap
```

[jekyllでサイトマップ(sitemap.xml)を生成する](https://www.xmisao.com/2014/08/25/generate-sitemap-in-jekyll.html)

# ダークモード

ダークモードには「メディアクエリ，クラス指定，CSS変数」の3つが存在しますが，  
本ホームページではJavaScriptを利用したクラス指定により，ダークモードを実現しています．  

cssとJavaScriptは以下のようになります．

<script src="https://gist.github.com/Absolute-Value/0aa3aa27c626f2af678b59cb0c42419d.js"></script>

<script src="https://gist.github.com/Absolute-Value/508378fe1493c1b1df7b6c76cc3b1743.js"></script>

他のページへ移動するとダークモードが戻ってしまうバグを修正しました（2023/02/10）

# お役立ちリンク
- [自分で作ったWebページをインターネット上に公開しよう！](https://prog-8.com/docs/github-pages){:target="_blank"}
- [クイックスタート \| Jekyll](http://jekyllrb-ja.github.io/docs/){:target="_blank"}
- [テンプレート言語Liquid](https://shopify.github.io/liquid/){:target="_blank"}
  - [Liquidで四則演算](https://blackpigtail.com/web-design/2680){:target="_blank"}
- [アイコン一覧](https://fontawesome.com/icons){:target="_blank"}
- [markdownでの画像リサイズ](https://qiita.com/shti_f/items/b819d7fd8cb79ae29687){:target="_blank"}
- [ファビコンの設定](https://techacademy.jp/magazine/30972){:target="_blank"}
    - [ファビコン生成](https://favicon-generator.mintsu-dev.com/){:target="_blank"}
- [ハイライトカラー](https://github.com/rouge-ruby/rouge/wiki/List-of-supported-languages-and-lexers){:target="_blank"}
- [Best-README-Template](https://github.com/othneildrew/Best-README-Template)
- [shields.io](https://shields.io/)