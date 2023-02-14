---
title: "退屈なことはPythonにやらせよう③"
date: "2022-07-20 21:00:00"
update: "2022-07-20 21:00:00"
category: "Blog"
hero: https://github.com/oreilly-japan/automatestuff-ja/raw/master/automate-the-boring-stuff-with-python.png
tags: ["python"]
math: true
layout: blog
excerpt: 書籍 「退屈なことはPythonにやらせよう 」（原書名『Automate the Boring Stuff with Python』）のpythonプログラムの実装の続き（9章）です。
toc: true
---

# はじめに

書籍 「[退屈なことはPythonにやらせよう Automate the boring stuff with python](https://www.oreilly.co.jp/books/9784873117782/){:target="_blank"}」（原書名『[Automate the Boring Stuff with Python](https://www.nostarch.com/automatestuff){:target="_blank"}』）のpythonプログラムの実装の続き（9章）です．

これまで：  
[退屈なことはPythonにやらせよう①]({{ 'blogs/python-boring-1' | relative_url }})  
[退屈なことはPythonにやらせよう②]({{ 'blogs/python-boring-2' | relative_url }})

<!--more-->

# 9章 ファイルの管理
## 9.4 フォルダをZIPファイルにバックアップする
指定したフォルダ全体をバックアップする  
過去のバージョンを残すために連番が付くようにする  
引数 "\<folder\>"： フォルダを指定

<script src="https://gist.github.com/Absolute-Value/77ddd3fa68dae534ed47cb529e9fa141.js"></script>

出力
```console
$ python3 9.4_BackupToZip.py ../08
Creating 08_1.zip...
Adding files in ./08
8.7_MultiClipBoard.py
8.10.3_RegexSearcher.py
8.10.1_MultiClipBoard.py
8.10.2_CompositionGenerator.py
Adding files in ./08/Composition
Origin.txt
Generated.txt
Done.
```
[08](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/tree/main/08){:target="_blank"}の中身を丸ごと、zipファイルにすることができました

## 9.7 演習
### 9.7.1　選択コピー
ディレクトリツリーを渡り歩いて、.pdfや.jpgなどの特定の拡張子のファイルを見つけて、新しいフォルダにコピーする  
引数 "\<folder\> \<extention\>"： コピーするフォルダと拡張子

<script src="https://gist.github.com/Absolute-Value/7f151f31edd9a4333becb9d19c304960.js"></script>

出力
```console
$ python3 9.7.1_SelectCopy.py ../08 py
Making folder: ./08
Copy file: ./08/8.7_MultiClipBoard.py
Making folder: ./08
Copy file: ./08/8.10.3_RegexSearcher.py
Making folder: ./08
Copy file: ./08/8.10.1_MultiClipBoard.py
Making folder: ./08
Copy file: ./08/8.10.2_CompositionGenerator.py
Done.
```
[08](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/tree/main/08){:target="_blank"}の中の .py ファイルをコピーすることができました

### 9.7.2 巨大なフォイルを探す
ディレクトリツリーを渡り歩いて、サイズの大きなサイズのフォルダを探し出す  
引数 "\<folder\>"： フォルダを指定  
引数 "\<folder\> \<size\>"： サイズも指定  
引数 "\<folder\> \<size\> \<unit\>"： 単位も指定(B,KB,MB,GB)

<script src="https://gist.github.com/Absolute-Value/23e9cc3bdc06517041098122ebded014.js"></script>

[08](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/tree/main/08){:target="_blank"}の中で、1KBを超えているファイルを探します

```console
$ python3 9.7.2_SearchLargeFile.py ../08 1 KB
./08/8.7_MultiClipBoard.py : 1.24 KB
./08/8.10.1_MultiClipBoard.py : 1.40 KB
Done.
```

1.24KBの8.7_MultiClipBoard.pyと  
1.40KBの8.10.1_MultiClipBoard.pyを見つけることができました

### 9.7.3 飛びつき連番の作成
9.7.3.1の準備用に番号の飛んだ連番を作成する

<script src="https://gist.github.com/Absolute-Value/475e83ba78629e4c61149dee763fa1f0.js"></script>

出力
```console
$ python3 9.7.3_Prepare.py
spam001.txt
spam002.txt
spam003.txt
spam005.txt
spam006.txt
spam007.txt
spam008.txt
spam009.txt
spam012.txt
spam013.txt
spam014.txt
spam015.txt
spam016.txt
spam017.txt
spam018.txt
spam019.txt
spam020.txt
spam021.txt
spam022.txt
spam023.txt
```

4, 10, 11が飛ばされたファイルを作成することができました

### 9.7.3.1 連番の飛びを埋める
指定した接頭語を持つ連番ファイルを探し出し、連番が飛んでいる箇所を見つけ、後に続くファイルの名前を変更する

<script src="https://gist.github.com/Absolute-Value/08aea4f0120affcc2bf354d523689e75.js"></script>

出力
```console
$ python3 9.7.3.1_FillSerialNumber.py 
Files/spam005.txt Files/spam004.txt
Files/spam006.txt Files/spam005.txt
Files/spam007.txt Files/spam006.txt
Files/spam008.txt Files/spam007.txt
Files/spam009.txt Files/spam008.txt
Files/spam012.txt Files/spam009.txt
Files/spam013.txt Files/spam010.txt
Files/spam014.txt Files/spam011.txt
Files/spam015.txt Files/spam012.txt
Files/spam016.txt Files/spam013.txt
Files/spam017.txt Files/spam014.txt
Files/spam018.txt Files/spam015.txt
Files/spam019.txt Files/spam016.txt
Files/spam020.txt Files/spam017.txt
Files/spam021.txt Files/spam018.txt
Files/spam022.txt Files/spam019.txt
Files/spam023.txt Files/spam020.txt
```
左が変更前、右が変更後。  
連番の隙間を埋めることができました

### 9.7.3.2 連番の隙間を開ける(9.7.3.1の逆)
連番ファイルの間に隙間を開けて、他の連番ファイルを入れられるようにする

<script src="https://gist.github.com/Absolute-Value/966b63d98e685ed6c17d5e1069676efd.js"></script>

出力
```console
$ Files/spam020.txt Files/spam021.txt
Files/spam019.txt Files/spam020.txt
Files/spam018.txt Files/spam019.txt
Files/spam017.txt Files/spam018.txt
Files/spam016.txt Files/spam017.txt
Files/spam015.txt Files/spam016.txt
Files/spam014.txt Files/spam015.txt
Files/spam013.txt Files/spam014.txt
Files/spam012.txt Files/spam013.txt
Files/spam011.txt Files/spam012.txt
Files/spam010.txt Files/spam011.txt
Files/spam009.txt Files/spam010.txt
Files/spam008.txt Files/spam009.txt
Files/spam007.txt Files/spam008.txt
Files/spam006.txt Files/spam007.txt
Files/spam005.txt Files/spam006.txt
Files/spam004.txt Files/spam005.txt
Files/spam003.txt Files/spam004.txt
```
左が変更前、右が変更後。  
3以降がずれたため、連番に隙間ができました

# つづき
[退屈なことはPythonにやらせよう④]({{ 'blogs/python-boring-4' | relative_url }})