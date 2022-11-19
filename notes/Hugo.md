---
title: "Hugoによるホームページ構築メモ"
date: 2022-05-02
update: 2022-05-02
category: "Note"
hero: https://d33wubrfki0l68.cloudfront.net/c38c7334cc3f23585738e40334284fddcaf03d5e/2e17c/images/hugo-logo-wide.svg
tags: ["Memo", "Hugo"]
layout: note
excerpt: 以前使用していたHugoを使ったホームページのメモです。
toc: true
---

### <span style="color: red; ">現在はHugoを使用していません　</span>

以前Githubのpagesデフォルトで作ったホームページが寂しく，ポストのページの見栄えが悪かったので、  
[コチラ](https://zenn.dev/okaponta/articles/c302f58507febc) を参考にHugoを使ったホームページに作り直しました。  
<!--more-->

## Hugoテーマ

Hugoにはデザインのテンプレートがあるので色々と吟味した結果、
[コチラ](https://hugo-toha.github.io/)のような見た目になる
[hugo-toha](https://github.com/hugo-toha/hugo-toha.github.io)を選択しました

## 使用方法

使用方法の[リンク](https://toha-guides.netlify.app/posts/getting-started/  )を今後の自分のためにも貼っておきます。  

この通りにやれば誰でもできると思います。（多少の英語力が要りますが）

### ローカルでのサイトへのアクセス
ターミナルでリポジトリを開き、
```
hugo server -t toha -w
```
を入力することで
[http://localhost:1313/](http://localhost:1313/)
にてアクセスできる

### 一連のGit操作
ターミナルでリポジトリを開き、
```
git add .
```
で追加した後、
```
git commit -m "コメント"
```
でコミットし、
```
git push origin source
```
でリモートにプッシュ