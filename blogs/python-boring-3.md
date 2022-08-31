---
title: "退屈なことはPythonにやらせよう③"
date: "2022-07-20 21:00:00"
category: "Blog"
hero: https://github.com/oreilly-japan/automatestuff-ja/raw/master/automate-the-boring-stuff-with-python.png
tags: ["python"]
math: true
layout: blog
excerpt: 書籍 「退屈なことはPythonにやらせよう 」（原書名『Automate the Boring Stuff with Python』）のpythonプログラムの実装の続き（9章）です。
---

書籍 「[退屈なことはPythonにやらせよう Automate the boring stuff with python](https://www.oreilly.co.jp/books/9784873117782/)」（原書名『[Automate the Boring Stuff with Python](https://www.nostarch.com/automatestuff)』）のpythonプログラムの実装の続き（9章）です．

これまで：  
[退屈なことはPythonにやらせよう①]({{ 'blogs/python-boring-1' | relative_url }})  
[退屈なことはPythonにやらせよう②]({{ 'blogs/python-boring-2' | relative_url }})

<!--more-->

# 9章 ファイルの管理
## 9.4 フォルダをZIPファイルにバックアップする
指定したフォルダ全体をバックアップする  
過去のバージョンを残すために連番が付くようにする  
引数 "\<folder\>"： フォルダを指定

プログラム（[9.4_BackupToZip.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/09/9.4_BackupToZip.py)）
```python
import zipfile, os, sys

# クリップボードの内容を保存
if len(sys.argv) != 2:
    print("ZIPにしたいフォルダを入力してください")

def backup_to_zip(folder):
    #folder = os.path.abspath(folder) # folderを絶対パスに

    # 既存のファイル名からファイル名の連番を決める
    number = 1
    while True:
        zip_filename = os.path.basename(folder) + '_' + str(number) + '.zip'
        if not os.path.exists(zip_filename):
            break
        number += 1

    # ZIPファイルを作成する
    print(f'Creating {zip_filename}...')
    backup_zip = zipfile.ZipFile(zip_filename, 'w')

    # フォルダのツリーを渡り歩いてその中のファイルを圧縮する
    for foldername, subfolders, filenames in os.walk(folder):
        foldername2 = foldername.replace('..','.')

        print(f'Adding files in {foldername2}')
        # 現在のフォルダをZIPファイルに追加する
        #backup_zip.write(foldername)
        # 現在のフォルダの中の全ファイルをZIPファイルに追加する
        for filename in filenames:
            new_base = os.path.basename(folder) + '_'
            print(new_base)
            if filename.startswith(new_base) and filename.endswith('.zip'):
                continue
            backup_zip.write(os.path.join(foldername, filename), os.path.join(foldername2,filename))

    backup_zip.close()
    print("Done.")

backup_to_zip(sys.argv[1])
```

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
[08](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/tree/main/08)の中身を丸ごと、zipファイルにすることができました

## 9.7 演習
### 9.7.1　選択コピー
ディレクトリツリーを渡り歩いて、.pdfや.jpgなどの特定の拡張子のファイルを見つけて、新しいフォルダにコピーする  
引数 "\<folder\> \<extention\>"： コピーするフォルダと拡張子

プログラム（[9.7.1_SelectCopy.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/09/9.7.1_SelectCopy.py)）
```python
import shutil, os, sys

# クリップボードの内容を保存
if len(sys.argv) != 3:
    print("コピーにしたいフォルダと拡張子を入力してください")

def select_copy(folder, extention):
    #folder = os.path.abspath(folder) # folderを絶対パスに

    # フォルダのツリーを渡り歩いてその中のファイルを圧縮する
    for foldername, subfolders, filenames in os.walk(folder):
        new_foldername = foldername.replace('..','.')

        # 現在のフォルダの中の全ファイルをZIPファイルに追加する
        for filename in filenames:
            if str(extention) in filename:
                os.makedirs(new_foldername, exist_ok=True)
                print(f'Making folder: {new_foldername}')

                newfile_path = os.path.join(new_foldername,filename)
                shutil.copy(os.path.join(foldername, filename), newfile_path)
                print(f'Copy file: {newfile_path}')

    print("Done.")

select_copy(sys.argv[1], sys.argv[2])
```

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
[08](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/tree/main/08)の中の .py ファイルをコピーすることができました

### 9.7.2 巨大なフォイルを探す
ディレクトリツリーを渡り歩いて、サイズの大きなサイズのフォルダを探し出す  
引数 "\<folder\>"： フォルダを指定  
引数 "\<folder\> \<size\>"： サイズも指定  
引数 "\<folder\> \<size\> \<unit\>"： 単位も指定(B,KB,MB,GB)

プログラム（[9.7.2_SearchLargeFile.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/09/9.7.2_SearchLargeFile.py)）
```python
import os, sys

# クリップボードの内容を保存

def search_file(folder, size=100, unit='KB'):
    folder = os.path.abspath(folder) # folderを絶対パスに

    # フォルダのツリーを渡り歩いてその中のファイルを圧縮する
    for foldername, subfolders, filenames in os.walk(folder):

        # 現在のフォルダの中の全ファイルをZIPファイルに追加する
        for filename in filenames:
            file_path = (os.path.join(foldername, filename))
            
            file_size = os.path.getsize(file_path)
            if unit == 'KB':
                file_size = file_size / 1000
            elif unit == 'MB':
                file_size = file_size / 1000 / 1000
            elif unit == 'GB':
                file_size == file_size / 1000 / 1000 / 1000

            if  file_size > int(size):
                print(f'{file_path} : {file_size:.2f} {unit}')

    print("Done.")

if len(sys.argv) < 2:
    print("サイズの大きいファイルを探したいフォルダを入力してください")
elif len(sys.argv) == 2:
    search_file(sys.argv[1])
elif len(sys.argv) == 3:
    search_file(sys.argv[1], sys.argv[2])
else:
    search_file(sys.argv[1], sys.argv[2], sys.argv[3])
```

[08](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/tree/main/08)の中で、1KBを超えているファイルを探します

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

プログラム（[9.7.3_Prepare.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/09/9.7.3_Prepare.py)）
```python
import os

def prepare_serial_number(folder='Files', head='spam'):
    os.makedirs(folder, exist_ok=True)

    for i in range(1, 23+1):
        if i == 4 or i == 10 or i==11:
            continue
        print(head + str(i).zfill(3) + '.txt')
        with open(os.path.join(folder, head + str(i).zfill(3) + '.txt'), 'a') as f:
            f.write(str(i))

prepare_serial_number()
```

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

プログラム（[9.7.3.1_FillSerialNumber.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/09/9.7.3.1_FillSerialNumber.py)）
```python
import sys, os

def fill_searial_number(folder='Files', head='spam'):
    if not os.path.exists(folder):
        print('フォルダーが存在しません')

    while(True):
        count = 0
        num = 1
        filenames = sorted(os.listdir(folder))
        for filename in filenames:
            if os.path.isdir(filename):
                continue
            
            if not str(num) in filename:
                num_length = len(os.path.splitext(filename.lstrip(head))[0])
                before_filepath = os.path.join(folder, filename)
                after_filename = head + str(num).zfill(num_length) + os.path.splitext(filename)[1]
                after_filepath = os.path.join(folder, after_filename)
                print(before_filepath, after_filepath)
                os.rename(before_filepath, after_filepath)
                count += 1
            else:
                filename = filename.lstrip(head)
            num += 1
        if count == 0:
            break

if len(sys.argv) < 2:
    fill_searial_number()
elif len(sys.argv) == 2:
    fill_searial_number(sys.argv[1])
else:
    fill_searial_number(sys.argv[1], sys.argv[2])
```

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

プログラム（[9.7.3.2_ExpandSerialNumber.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/09/9.7.3.2_ExpandSerialNumber.py)）
```python
import sys, os

def expand_serial_number(expand_num=3, folder='Files', head='spam'):
    filenames = sorted(os.listdir(folder), reverse=True)
    if len(filenames) < expand_num:
        sys.exit()
    for filename in filenames:
        before_filepath = os.path.join(folder, filename)
        num = os.path.splitext(filename.lstrip(head))[0]
        after_filename = head + str(int(num)+1).zfill(len(num)) + os.path.splitext(filename)[1]
        after_filepath = os.path.join(folder, after_filename)
        print(before_filepath, after_filepath)
        os.rename(before_filepath, after_filepath)
        if int(num) == expand_num:
            break

if len(sys.argv) < 2:
    expand_serial_number()
else:
    expand_serial_number(int(sys.argv[1]))
```

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