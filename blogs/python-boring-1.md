---
title: "退屈なことはPythonにやらせよう①"
date: "2022-07-18 21:00:00"
category: "Blog"
hero: https://github.com/oreilly-japan/automatestuff-ja/raw/master/automate-the-boring-stuff-with-python.png
tags: ["python"]
math: true
layout: blog
---

書籍 「[退屈なことはPythonにやらせよう Automate the boring stuff with python](https://www.oreilly.co.jp/books/9784873117782/)」（原書名『[Automate the Boring Stuff with Python](https://www.nostarch.com/automatestuff)』）のpythonプログラムを実装していきます．

<!--more-->

# 1・2章
演習プロジェクトがないため省略

# 3章　関数
### 3.11.1 コラッツ数列
偶数なら$\frac{n}{2}$，奇数なら$3n+1$を繰り返すことで，\
最終的に$1$に収束するコラッツ数列を計算  

プログラム（[3.11.1_CollatzSequence.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/03/3.11.1_CollatzSequence.py)）
```python
def collatz(number):
    if number % 2 == 0:
        return number / 2
    else:
        return 3 * number + 1

number = int(input("整数を入力してください："))
while(True):
    print(number)
    if number == 1:
        break
    else:
        number = int(collatz(number))
```

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

プログラム（[3.11.2_InputValidity.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/03/3.11.2_InputValidity.py)）
```python
def collatz(number):
    if number % 2 == 0:
        return number / 2
    else:
        return 3 * number + 1

while(True):
    try:
        number = int(input("整数を入力してください："))
        break
    except:
        print("エラー：整数値を入力してください")

while(True):
    print(number)
    if number == 1:
        break
    else:
        number = int(collatz(number))
```

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

プログラム（[4.10.1_Comma.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/04/4.10.1_Comma.py)）
```python
def AddComma(given_list):
    string = ''
    for _ in range(len(given_list) - 1):
        string += given_list.pop(0) + ', '
    string += 'and ' + given_list[0]
    return string

spam = ['apples', 'bananas', 'tohu', 'cats']
print(AddComma(spam))
```

出力
```console
$ python3 4.10.1_Comma.py 
apples, bananas, tohu, and cats
```

### 4.10.2 絵文字グリッド
リストを受け取り，絵として表示

プログラム（[4.10.2_CharacterPicture.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/04/4.10.2_CharacterPicture.py)）
```python
grid = [['.', '.', '.', '.', '.', '.'],
        ['.', '0', '0', '.', '.', '.'],
        ['0', '0', '0', '0', '.', '.'],
        ['0', '0', '0', '0', '0', '.'],
        ['.', '0', '0', '0', '0', '0'],
        ['0', '0', '0', '0', '0', '.'],
        ['0', '0', '0', '0', '.', '.'],
        ['.', '0', '0', '.', '.', '.'],
        ['.', '.', '.', '.', '.', '.']]

for i in range(len(grid[0])):
    for j in range(len(grid)):
        print(grid[j][i], end='')
    print('')
```

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
htmlだと、0と.の文字の幅が異なるようで、残念な形になっていますね...

# 5章　辞書とデータ構造
### 5.6.1 ファンタジーゲームの持ち物リスト
持ち物リスト（辞書型）の表示

プログラム（[5.6.1_Inventory.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/05/5.6.1_Inventory.py)）
```python
def display_inventory(inventory):
    print("持ち物リスト")
    item_total = 0
    for k, v in inventory.items():
        print(f'{v} {k}')
        item_total += v
    print("アイテム総数：" + str(item_total))

stuff = {'ロープ': 1, 'たいまつ': 6, '金貨': 42, '手裏剣': 1, '矢': 12,}
display_inventory(stuff)
```

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

プログラム（[5.6.2_AddToInventory.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/05/5.6.2_AddToInventory.py)）
```python
def display_inventory(inventory):
    print("持ち物リスト")
    item_total = 0
    for k, v in inventory.items():
        print(f'{v} {k}')
        item_total += v
    print("アイテム総数：" + str(item_total))

def add_to_intentory(inventory, added_items):
    for item in added_items:
        inventory.setdefault(item, 0)
        inventory[item] += 1
    return inventory

inv = {'金貨': 42, 'ロープ': 1}
dragon_loot = ['金貨', '手裏剣', '金貨', '金貨', 'ルビー']
inv = add_to_intentory(inv, dragon_loot)
display_inventory(inv)
```

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

プログラム（[6.7.1_ShowTable.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/06/6.7.1_ShowTable.py)）
```python
def print_table(table_data):
    col_widths = [0] * len(table_data)
    for i, datas in enumerate(table_data):
        for data in datas:
            length = len(data)
            if length > col_widths[i]:
                col_widths[i] = length
                
    for i in range(len(table_data[0])):
        for j in range(len(table_data)):
            print(table_data[j][i].rjust(col_widths[j]), end='')
            print(' ',end='')
        print('')

table_data = [['apples', 'oranges', 'cherries', 'banana'],
              ['Alice', 'Bob', 'Carol', 'David'],
              ['dogs', 'cats', 'moose', 'goose']]
print_table(table_data)
```

出力
```console
$ python3 6.7.1_ShowTable.py 
  apples Alice  dogs 
 oranges   Bob  cats 
cherries Carol moose 
  banana David goose 
```

例によってhtmlではきれいに表示されません...

# つづく