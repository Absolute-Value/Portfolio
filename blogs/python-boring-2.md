---
title: "退屈なことはPythonにやらせよう②"
date: "2022-07-19 21:00:00"
category: "Blog"
hero: https://github.com/oreilly-japan/automatestuff-ja/raw/master/automate-the-boring-stuff-with-python.png
tags: ["python"]
math: true
layout: blog
excerpt: 書籍 「退屈なことはPythonにやらせよう 」（原書名『Automate the Boring Stuff with Python』）のpythonプログラムの実装の続き（7・8章）です。
---

書籍 「[退屈なことはPythonにやらせよう Automate the boring stuff with python](https://www.oreilly.co.jp/books/9784873117782/)」（原書名『[Automate the Boring Stuff with Python](https://www.nostarch.com/automatestuff)』）のpythonプログラムの実装の続きです．

<!--more-->

# 7章　正規表現によるパターンマッチング
### 7.18.1 強いパスワードの検出
正規表現を用いて，パスワードの強さを判定  
強いパスワード（８文字以上，大文字と小文字を含む，１つ以上の数字を含む）

プログラム（[7.18.1_PasswordDetection.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/07/7.18.1_PasswordDetection.py)）
```python
import re

given_password = str(input("パスワードを入力してください："))
is_strong = True

if len(given_password) < 8:
    print("弱い：8文字以上を推奨")
    is_strong = False

upper_regex = re.compile(r'[A-Z]')
mo_u = upper_regex.search(given_password)
lower_regex = re.compile(r'[a-z]')
mo_l = lower_regex.search(given_password)
if mo_u is None or mo_l is None:
    print("弱い：大文字と小文字を推奨")
    is_strong = False

num_regex = re.compile(r'\d')
mo = num_regex.search(given_password)
if mo is None:
    print("弱い：一つ以上の数字を推奨")
    is_strong = False

if is_strong:
    print("強いパスワードです。")
```

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

プログラム（[7.18.2_StripMethod.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/07/7.18.2_StripMethod.py)）
```python
import re

def strip(string, target=' '):
    regex = re.compile(f'^{str(target)}+|{str(target)}+$')
    string = regex.sub('', string)
    return string

given_string = str(input("文字列を入力してください："))
target_string = str(input("変えたい文字列を入力してください（何も入力しないとスペース）："))
if target_string == '':
    target_string = ' '

print(strip(given_string, target_string))
```

出力
```console
$ python3 7.18.2_StripMethod.py      
文字列を入力してください：aaaTextaaa
変えたい文字列を入力してください（何も入力しないとスペース）：a
Text
```

# 8章　ファイルの読み書き
## 8.7 マルチクリップボード
クリップボードのテキストを保存・復元  
引数 "save \<keyword\>"：クリップボードをキーワードに紐づけて保存  
引数 "\<keyword\>"：キーワードに紐づけられたテキストをクリップボードにコピー  
引数 "list"：全キーワードをクリップボードにコピー  

プログラム（[8.7_MultiClipBoard.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/08/8.7_MultiClipBoard.py)）
```python
import shelve, pyperclip, sys

mcb_shelf = shelve.open('mcb')

# クリップボードの内容を保存
if len(sys.argv) == 3 and sys.argv[1].lower() == 'save':
    mcb_shelf[sys.argv[2]] = pyperclip.paste()
elif len(sys.argv) == 2:
    # キーワード一覧と，内容の読み込み
    if sys.argv[1].lower() == 'list':
        pyperclip.copy(str(list(mcb_shelf.keys())))
    elif sys.argv[1] in mcb_shelf:
        pyperclip.copy(mcb_shelf[sys.argv[1]])

mcb_shelf.close()
```

出力
```console
$ 
```

## 8.10 演習
### 8.10.1 マルチクリップボードを拡張
マルチクリップボードのプログラムを引数 "delete \<keyword\>"でシェルフからキーワードを削除できるように

プログラム（[8.10.1_MultiClipBoard.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/08/8.10.1_MultiClipBoard.py)）
```python
import shelve, pyperclip, sys

mcb_shelf = shelve.open('mcb')

# クリップボードの内容を保存
if len(sys.argv) == 3:
    if sys.argv[1].lower() == 'save':
        mcb_shelf[sys.argv[2]] = pyperclip.paste()
    elif sys.argv[1].lower() == 'delete':
        mcb_shelf.pop(sys.argv[2])

elif len(sys.argv) == 2:
    # キーワード一覧と，内容の読み込み
    if sys.argv[1].lower() == 'list':
        pyperclip.copy(str(list(mcb_shelf.keys())))
    elif sys.argv[1] in mcb_shelf:
        pyperclip.copy(mcb_shelf[sys.argv[1]])

mcb_shelf.close()
```

出力
```console
$ 
```

### 8.10.2 作文ジェネレータ
テキストファイルを読み込み，ADJECTIVE(形容詞),NOUN(名詞),ADVERB(副詞),VERB(動詞)を書き換える作文ジェネレータ


プログラム（[8.10.2_CompositionGenerator.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/08/8.10.2_CompositionGenerator.py)）
```python
import re

origin_file = open("Composition/Origin.txt")
origin_content = origin_file.read()
origin_file.close()

content_regex = re.compile(r'ADJECTIVE|NOUN|ADVERB|VERB')
targets = content_regex.findall(origin_content)

export_content = origin_content
for target in targets:
    export_content = re.sub(target, input(f"Enter {target.lower()}:\n"), export_content, 1)

print(export_content)
export_file = open("Composition/Generated.txt", 'a')
export_file.write(export_content)
export_file.close()
```

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


プログラム（[8.10.3_RegexSearcher.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/08/8.10.3_RegexSearcher.py)）
```python
import re, sys, os

if len(sys.argv) != 2:
    print("探索したいフォルダのパスを入力してください")
    sys.exit()

regex = re.compile(str(input("正規表現を入力してください：")))
for file in os.listdir(sys.argv[1]):
    if ".txt" in file:
        txt_file = open(os.path.join(sys.argv[1], file))
        txt_content = txt_file.read()
        txt_file.close()

        targets = regex.findall(txt_content)
        if len(targets) != 0:
            print(file)
            
            export_content = txt_content
            for target in set(targets):
                export_content = re.sub(target, f'"{target}"', export_content)
            print(export_content)
```

出力
```console
$ 
```