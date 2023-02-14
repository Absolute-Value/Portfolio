---
title: "退屈なことはPythonにやらせよう①"
date: "2022-07-18 21:00:00"
update: "2022-07-18 21:00:00"
category: "Blog"
hero: https://github.com/oreilly-japan/automatestuff-ja/raw/master/automate-the-boring-stuff-with-python.png
tags: ["python"]
math: true
layout: blog
excerpt: 書籍 「退屈なことはPythonにやらせよう 」（原書名『Automate the Boring Stuff with Python』）のpythonプログラムを実装していきます．
toc: true
---

# はじめに

書籍 「[退屈なことはPythonにやらせよう](https://www.oreilly.co.jp/books/9784873117782/){:target="_blank"}」（原書名『[Automate the Boring Stuff with Python](https://www.nostarch.com/automatestuff){:target="_blank"}』）のpythonプログラムを実装していきます．

<!--more-->

# 1・2章
演習プロジェクトがないため省略

# 3章　関数
### 3.11.1 コラッツ数列
偶数なら$\frac{n}{2}$，奇数なら$3n+1$を繰り返すことで，\
最終的に$1$に収束するコラッツ数列を計算  

<script src="https://gist.github.com/Absolute-Value/9dd7fdf91c7866e07e87ff3fe8fe5099.js"></script>

出力
```console
$ python3 3.11.1_CollatzSequence.py
整数を入力してください：12
12
6
3
10
5
16
8
4
2
1
```

### 3.11.2 入力の妥当性検証
コラッツ数列のプログラムの入力が整数でない場合に、整数を促すメッセージを表示

<script src="https://gist.github.com/Absolute-Value/117217311d745d3520beeea82b9cfb4c.js"></script>

出力
```console
$ python3 3.11.2_InputValidity.py     
整数を入力してください：5.53
エラー：整数値を入力してください
整数を入力してください：2
2
1
```

# 4章　リスト
### 4.10.1 コンマ付け
リストの要素をカンマとスペースで並べ，最後の要素の前にandを挿入

<script src="https://gist.github.com/Absolute-Value/3dd91eb79875ab4c7fa82aa976e0ea1b.js"></script>

出力
```console
$ python3 4.10.1_Comma.py 
apples, bananas, tohu, and cats
```

### 4.10.2 絵文字グリッド
リストを受け取り，絵として表示

<script src="https://gist.github.com/Absolute-Value/5ba772a2cc1311c744cb2d1693faf32b.js"></script>

出力
```console
$ python3 4.10.2_CharacterPicture.py 
..00.00..
.0000000.
.0000000.
..00000..
...000...
....0....
```

# 5章　辞書とデータ構造
### 5.6.1 ファンタジーゲームの持ち物リスト
持ち物リスト（辞書型）の表示

<script src="https://gist.github.com/Absolute-Value/99055e31d321770f5e78853dfb72449d.js"></script>

出力
```console
$ python3 5.6.1_Inventory.py        
持ち物リスト
1 ロープ
6 たいまつ
42 金貨
1 手裏剣
12 矢
アイテム総数：62
```

### 5.6.2 ファンタジーゲームの持ち物リスト用にリストから辞書に移す関数
持ち物リストに獲得したアイテムを追加

<script src="https://gist.github.com/Absolute-Value/e6936cb7f0f6ef16c21e562963326889.js"></script>

出力
```console
$ python3 5.6.2_AddToInventory.py 
持ち物リスト
45 金貨
1 ロープ
1 手裏剣
1 ルビー
アイテム総数：48
```

獲得したアイテム(dragon_loot)が持ち物リスト(inv)にきちんと追加されていますね

# 6章　文字列操作
### 6.7.1 表の表示
文字列のリストを右揃えに成形して表示

<script src="https://gist.github.com/Absolute-Value/a42283342b75f169ee67b0b60ddde4d3.js"></script>

出力
```console
$ python3 6.7.1_ShowTable.py 
  apples Alice  dogs 
 oranges   Bob  cats 
cherries Carol moose 
  banana David goose 
```

例によってhtmlではきれいに表示されません...

# つづき
[退屈なことはPythonにやらせよう②]({{ 'blogs/python-boring-2' | relative_url }})