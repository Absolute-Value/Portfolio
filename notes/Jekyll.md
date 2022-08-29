---
title: "Jekyll ホームページ 個人的メモ"
date: "2022-07-01 12:00:00"
category: "Note"
hero: http://jekyllrb-ja.github.io/img/logo-2x.png
tags: ["Memo", "Jekyll"]
layout: note
excerpt: Jekyll関連で役に立ちそうな個人的メモです。
---

Jekyll関連で役に立ちそうな個人的メモです。

<!--more-->

[インストール関連]({{ 'notes/Jekyll-Install' | relative_url }})

# Jekyllの新規作成

```console
$ jekyll new <name>
```  
{name}は任意のプロジェクト名

# Jekyllの起動

ローカルでサーバーを立ち上げる時  
```console
$ jekyll serve
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

## 元のプロジェクトとサイト用のプロジェクトに対してgit操作するの面倒だったので自動化するbashを作成しました
### git.sh
{% highlight shell linenos %}
#!/bin/sh

git add .
if [ $# -eq 0 ]; then
    git commit -m "Update"
else
    git commit -m "$1"
fi
git push
cd _site
git add .
if [ $# -ne 0 ]; then
    git commit -m "Update"
else
    git commit -m "$1"
fi
git push
cd ../
{% endhighlight %}

### 実行
```console
$ bash git.sh
```

引数にコミットメッセージ入れれえます

# Markdown記法
## インラインコード
\'で囲む (Shift + @)
## コード
\'\'\'で囲む

# お役立ちリンク
- [自分で作ったWebページをインターネット上に公開しよう！](https://prog-8.com/docs/github-pages)
- [クイックスタート \| Jekyll](http://jekyllrb-ja.github.io/docs/)
- [テンプレート言語Liquid](https://shopify.github.io/liquid/)
  - [Liquidで四則演算](https://blackpigtail.com/web-design/2680)
- [アイコン一覧](https://johobase.com/font-awesome-icon-font-list-free/)
- [markdownでの画像リサイズ](https://qiita.com/shti_f/items/b819d7fd8cb79ae29687)
- [ファビコンの設定](https://techacademy.jp/magazine/30972)
    - [ファビコン生成](https://favicon-generator.mintsu-dev.com/)
- [ハイライトカラー](https://github.com/rouge-ruby/rouge/wiki/List-of-supported-languages-and-lexers)