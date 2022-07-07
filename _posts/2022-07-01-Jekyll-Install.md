---
title: "Jekyllによるホームページ構築メモ"
date: "2022-07-01 00:00:00"
identifier: Jekyll-Install
category: "Note"
hero: http://jekyllrb-ja.github.io/img/logo-2x.png
tags: ["Note"]
math: true
layout: note
---

以前，Hugoで作成していたホームページがアップデートをしたところGithub pagesで認識しなくなり困ったので  
再度同じことが起こっても大丈夫なように，構築方法をまとめておきます

<!--more-->

# インストール (macOS)

## Rubyのインストール

<b>chruby</b>と<b>ruby-install</b>のインストール

```console
$ brew install chruby ruby-install
```

rubyのインストール

```console
$ ruby-install ruby
```

Pathを通す  
(3.1.2の場所はインストールしたバージョンに変更)

```console
$ echo "source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh" >> ~/.zshrc
$ echo "source $(brew --prefix)/opt/chruby/share/chruby/auto.sh" >> ~/.zshrc
$ echo "chruby ruby-3.1.2" >> ~/.zshrc
```
Rubyのバージョン確認

```console
$ ruby -v
```
Rubyのバージョンが2など最新でない場合は端末を再起動

## jekyllのインストール
```
$ gem install jekyll
```
## Jekyll使い方はコチラ
[Jekyll ホームページ 個人的メモ](Jekyll.html)

# その他設定
[Markdownで数式を使用する方法](https://qiita.com/memakura/items/e4d2de379f98ad7be498)
