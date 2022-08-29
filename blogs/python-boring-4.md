---
title: "退屈なことはPythonにやらせよう④"
date: "2022-07-22 21:00:00"
category: ""
hero: https://github.com/oreilly-japan/automatestuff-ja/raw/master/automate-the-boring-stuff-with-python.png
tags: ["python"]
math: true
layout: blog
excerpt: 書籍 「退屈なことはPythonにやらせよう 」（原書名『Automate the Boring Stuff with Python』）のpythonプログラムの実装の続き（10・11章）です。
---

書籍 「[退屈なことはPythonにやらせよう Automate the boring stuff with python](https://www.oreilly.co.jp/books/9784873117782/)」（原書名『[Automate the Boring Stuff with Python](https://www.nostarch.com/automatestuff)』）のpythonプログラムの実装の続き（10・11章）です．

<!--more-->

# 10章　デバッグ
## 10.5 IDLEのデバッガ
### 10.5.7 ブレークポイント
1000回のコイン投げをシミュレーション

プログラム（[]()）
```python
import random

heads = 0
for i in range(0,1001):
    if random.randint(0,1) == 1:
        heads += 1
    if i == 500:
        print('半分完了！')
print(f'表は{heads}回出ました')
```

出力
```console
$ python3 10.5.7_coinFlip.py 
半分完了！
表は511回出ました
```

## 10.8 演習
### 10.8.1 コイン投げゲームをデバッグする
コインを投げて裏と表を当てるゲームにバグがあるため、バグを見つける   

オリジナルのバグありプログラム（[10.8.1_CoinGame.py]()）
```python
import random

guess = ''
while guess not in ('表', '裏'):
    print('コインの裏表を当ててください。表か裏かを入力してください：')
    guess = input()

toss = random.randint(0,1) # 0は裏、1は表
if toss == guess:
    print('当たり！')
else:
    print('はずれ！もう一回あてて！')
    guess = input()
    # 2回目を振り直すなら、ここに
    # toss = random.randint(0,1)
    # を入れる
    if toss == guess:
        print('当たり！')
    else:
        print('はずれ。このゲームは苦手ですね。')
```

出力
```console
$ python3 10.8.1_CoinGame.py     
コインの裏表を当ててください。表か裏かを入力してください：
表
はずれ！もう一回あてて！
裏
はずれ。このゲームは苦手ですね。
```
入力は表か裏なのに、答えは0か1である。
当たるわけがない。
そこで、裏と表を0と1に変換する関数を追加した。

バグを修正したプログラム（[10.8.1_CoinGameDebug.py]()）
```python
import random

def StrToNum(input):
    if input ==  '表':
        return 1
    else:
        return 0

guess = ''
while guess not in ('表', '裏'):
    print('コインの裏表を当ててください。表か裏かを入力してください：')
    guess = input()

guess = StrToNum(guess)
toss = random.randint(0,1) # 0は裏、1は表
if toss == guess:
    print('当たり！')
else:
    print('はずれ！もう一回あてて！')
    while guess not in ('表', '裏'):
        print('表か裏かを入力してください：')
        guess = input()
    guess = StrToNum(guess)
    if toss == guess:
        print('当たり！')
    else:
        print('はずれ。このゲームは苦手ですね。')
```

出力
```console
$ python3 10.8.1_CoinGameDebug.py
コインの裏表を当ててください。表か裏かを入力してください：
表
はずれ！もう一回あてて！
表か裏かを入力してください：
裏
当たり！
```

# 11章 Webスクレイピング
## 11.1 webbrowserモジュールを用いたmapIt.py
コマンドラインやクリップボードに指定した住所の地図を開く

プログラム（[]()）
```python

```

出力
```console
$ 
```

## 11.5 Google検索 "I'm Feeling Lucky"
コマンドラインから検索をし、上位の検索結果をタブに開く  
引数 "\<keyword\>"：検索したいワード

プログラム（[]()）
```python

```

出力
```console
$ 
```

## 11.6 XKCDコミックをダウンロードする
XKCDコミックをひとつずつダウンロードする

プログラム（[]()）
```python

```

出力
```console
$ 
```

## 11.10 演習
### 11.10.1 コマンドライン電子メーラー
コマンドラインから電子メールアドレスと本文テキストを受け取り、電子メールを送信する
引数 "\<address\> \<text\>"：アドレスとテキスト

プログラム（[]()）
```python

```

出力
```console
$ 
```

### 11.10.2 画像サイトのダウンローダー
写真共有サイトFlickeで画像を検索し、検索結果の画像をすべてダウンロード  
引数 "\<keyword\>"：検索したいワード

プログラム（[]()）
```python

```

出力
```console
$ 
```

### 11.10.3 2048
2048というゲームを自動的に上右下左を繰り返し入力して遊ぶ

プログラム（[]()）
```python

```

出力
```console
$ 
```

### 11.10.4 リンクの検査
指定したURLのページからリンクされたすべてのページをダウンロードする

プログラム（[]()）
```python

```

出力
```console
$ 
```