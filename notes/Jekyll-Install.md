---
title: "Jekyllによるホームページ構築メモ"
date: "2022-07-01 00:00:00"
category: "Note"
hero: http://jekyllrb-ja.github.io/img/logo-2x.png
tags: ["Memo", "Jekyll"]
layout: note
---

Jekyllを使用したホームページの作成方法の個人的なメモです。

以前，Hugoで作成していたホームページがアップデートをしたところGithub pagesで認識しなくなり困ったので  
再度同じことが起こっても大丈夫なように，構築方法をまとめておきます。

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
```console
$ gem install jekyll
```

# エラー対処
コマンドライン起動時に`chruby: unknown Ruby: ruby-3.1.1`と表示される場合  
  
./.zshrc内に誤ったバージョンを追加してしまっているため，[vi]()などで文を削除すると解決する

## Jekyll使い方はコチラ
[Jekyll ホームページ 個人的メモ]()

# その他設定
[Markdownで数式を使用する方法](https://qiita.com/memakura/items/e4d2de379f98ad7be498)
