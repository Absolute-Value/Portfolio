---
title: "退屈なことはPythonにやらせよう②"
date: "2022-07-19 21:00:00"
update: "2022-07-19 21:00:00"
category: "Blog"
hero: https://github.com/oreilly-japan/automatestuff-ja/raw/master/automate-the-boring-stuff-with-python.png
tags: ["python"]
math: true
layout: blog
excerpt: 書籍 「退屈なことはPythonにやらせよう 」（原書名『Automate the Boring Stuff with Python』）のpythonプログラムの実装の続き（7・8章）です。
toc: true
---

# はじめに

書籍 「[退屈なことはPythonにやらせよう Automate the boring stuff with python](https://www.oreilly.co.jp/books/9784873117782/){:target="_blank"}」（原書名『[Automate the Boring Stuff with Python](https://www.nostarch.com/automatestuff){:target="_blank"}』）のpythonプログラムの実装の続き（7・8章）です．

これまで：  
[退屈なことはPythonにやらせよう①]({{ 'blogs/python-boring-1' | relative_url }})

<!--more-->

# 7章　正規表現によるパターンマッチング
### 7.18.1 強いパスワードの検出
正規表現を用いて，パスワードの強さを判定  
強いパスワード（８文字以上，大文字と小文字を含む，１つ以上の数字を含む）

<script src="https://gist.github.com/Absolute-Value/225a1a4ce28ca7de7a496778666c7f39.js"></script>

出力
```console
$ python3 7.18.1_PasswordDetection.py
パスワードを入力してください：pass
弱い：8文字以上を推奨
弱い：大文字と小文字を推奨
弱い：一つ以上の数字を推奨

パスワードを入力してください：Pa22word
強いパスワードです。
```

### 7.18.2 正規表現を用いたstrip()メソッド
文字列メソッドのstrip()と同等の動きをする関数を定義  
文字列の先頭と末尾から指定した文字を除去（デフォルトは空白文字）

<script src="https://gist.github.com/Absolute-Value/f9a19c63126735a03dcae7b805a0a75b.js"></script>

出力
```console
$ python3 7.18.2_StripMethod.py      
文字列を入力してください：aaaTextaaa
変えたい文字列を入力してください（何も入力しないとスペース）：a
Text
```

# 8章　ファイルの読み書き
## 8.7 マルチクリップボード
クリップボードのテキストを保存・読込を行うプログラム

<script src="https://gist.github.com/Absolute-Value/38077d5b69a2e3025c762a1b795ba568.js"></script>

クリップ上の python を 1 として保存します
```console
$ python3 8.7_MultiClipBoard.py save 1
クリップボード上の python を 1　として保存しました
```

1をクリップボードに読み込みます
```console
$ python3 8.7_MultiClipBoard.py 1
python をクリップボードにコピーしました
```

先ほど保存した python をクリップボードに読み込むことができました  
キーワード一覧も取得してみます
```console
$ python3 8.7_MultiClipBoard.py list
全キーワードをクリップボードにコピーしました
```
クリップボードには正しく ['1'] が入っていました。

## 8.10 演習
### 8.10.1 マルチクリップボードを拡張
マルチクリップボードのプログラムを引数 "delete \<keyword\>"でシェルフからキーワードを削除できるように

<script src="https://gist.github.com/Absolute-Value/05813ea490ae45f5dc3b581be405fb30.js"></script>

先ほど保存した 1 を削除し、一覧をクリップボードに取得しました
```console
$ python3 8.10.1_MultiClipBoard.py delete 1
1を削除しました
$ python3 8.10.1_MultiClipBoard.py list    
全キーワードをクリップボードにコピーしました
```
クリップボードには [] が入っており、1 が正しく消えていました

### 8.10.2 作文ジェネレータ
テキストファイルを読み込み，ADJECTIVE(形容詞),NOUN(名詞),ADVERB(副詞),VERB(動詞)を書き換える作文ジェネレータ

<script src="https://gist.github.com/Absolute-Value/8ec91d506e5d57d89840019e5eaad528.js"></script>

入力（Origin.txt）
```
The ADJECTIVE panda walked to the NOUN and then VERB. A nearby NOUN was unaffected by these events.
```

実行
```console
$ python3 8.10.2_CompositionGenerator.py 
Enter adjective:
silly
Enter noun:
chandelier
Enter verb:
screamed
Enter noun:
pickup truck
```

出力（Generated.txt）
```
The silly panda walked to the chandelier and then screamed. A nearby pickup truck was unaffected by these events.
```

### 8.10.3 正規表現探索
指定したフォルダ内のtxtファイルを開いて，入力した正規表現にマッチする箇所を探索する  
引数 "\<path\>"：探索するフォルダ

<script src="https://gist.github.com/Absolute-Value/c6722ab2734f04e65bad38a9688c4fe7.js"></script>

出力
```console
$ python3 8.10.3_RegexSearcher.py Composition
正規表現を入力してください：f{2}    
Origin.txt
The ADJECTIVE panda walked to the NOUN and then VERB. A nearby NOUN was una"ff"ected by these events.
Generated.txt
The silly panda walked to the chandelier and then screamed. A nearby pickup truck was una"ff"ected by these events.
kei@kenoMacBook-Pro 08 % 
```
[Composition](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/tree/main/08/Composition){:target="_blank"}フォルダ内のtxtファイルの中で、  
fが二回続く箇所を探索し、見つけることができている。

# つづき
[退屈なことはPythonにやらせよう③]({{ 'blogs/python-boring-3' | relative_url }})