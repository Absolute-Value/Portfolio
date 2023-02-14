---
title: "退屈なことはPythonにやらせよう④"
date: "2022-07-22 21:00:00"
update: "2022-07-22 21:00:00"
category: "Blog"
hero: https://github.com/oreilly-japan/automatestuff-ja/raw/master/automate-the-boring-stuff-with-python.png
tags: ["python"]
math: true
layout: blog
excerpt: 書籍 「退屈なことはPythonにやらせよう 」（原書名『Automate the Boring Stuff with Python』）のpythonプログラムの実装の続き（10・11章）です。
toc: true
---

# はじめに

書籍 「[退屈なことはPythonにやらせよう Automate the boring stuff with python](https://www.oreilly.co.jp/books/9784873117782/){:target="_blank"}」（原書名『[Automate the Boring Stuff with Python](https://www.nostarch.com/automatestuff){:target="_blank"}』）のpythonプログラムの実装の続き（10・11章）です．

これまで：  
[退屈なことはPythonにやらせよう①]({{ 'blogs/python-boring-1' | relative_url }})  
[退屈なことはPythonにやらせよう②]({{ 'blogs/python-boring-2' | relative_url }})  
[退屈なことはPythonにやらせよう③]({{ 'blogs/python-boring-3' | relative_url }})

<!--more-->

# 10章　デバッグ
## 10.5 IDLEのデバッガ
### 10.5.7 ブレークポイント
1000回のコイン投げをシミュレーション

プログラム（[10.5.7_coinFlip.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/10/10.5.7_coinFlip.py){:target="_blank"}）
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

オリジナルのバグありプログラム（[10.8.1_CoinGame.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/10/10.8.1_CoinGame.py){:target="_blank"}）
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
入力は表か裏ですが、答えは0か1であるため当たるわけがないですね  
そこで、裏と表を0と1に変換する関数を追加しました

バグを修正したプログラム（[10.8.1_CoinGameDebug.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/10/10.8.1_CoinGameDebug.py){:target="_blank"}）
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

プログラム（[11.1_mapIt.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/11/11.1_mapIt.py){:target="_blank"}）
```python
import webbrowser, sys, pyperclip

if len(sys.argv) > 1:
    # コマンドラインから住所を取得する
    address = ' '.join(sys.argv[1:])
else:
    # クリップボードから住所を取得する
    address = pyperclip.paste()

webbrowser.open(f'https://www.google.com/maps/place/{address}')
```

「870 Valencia St, San Francisco, CA 94110」を検索します
```console
$ python3 11.1_mapIt.py 870 Valencia St, San Francisco, CA 94110
```

Googleマップで開くことができました  
![](/assets/images/blogs/python-boring-4/11.1.png)  

## 11.5 Google検索 "I'm Feeling Lucky"
コマンドラインからGoogle検索をし、上位の検索結果をタブに開く  
引数 "\<keyword\>"：検索したいワード

プログラム（[11.5_lucky.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/11/11.5_lucky.py){:target="_blank"}）
```python
import requests, sys, webbrowser, bs4

print('Googling...') # Googleページをダウンロード中にテキストを表示
res = requests.get('http://google.com/search?q=' + ' '.join(sys.argv[1:]))
res.raise_for_status()

# 上位の検索結果のリンクを取得する
soup = bs4.BeautifulSoup(res.text, 'html5lib')
link_elems = soup.select(".egMi0 a")
print(link_elems)

# 各結果をブラウザのタブで開く
num_open = min(5, len(link_elems))
for i in range(num_open):
    webbrowser.open('http://google.com' + link_elems[i].get('href'))
```

「python」でGoogle検索をします
```console
$ python3 11.5_lucky.py python       
Googling...
```
「python」での上位検索5つをタブで開くことができました  
![](/assets/images/blogs/python-boring-4/11.5.png)

## 11.6 XKCDコミックをダウンロードする
XKCDコミックをひとつずつダウンロードする

プログラム（[11.6_DownloadXkcd.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/11/11.6_DownloadXkcd.py){:target="_blank"}）
```python
import requests, os, bs4
import time

url = 'http://xkcd.com/'               # 開始URL
os.makedirs('xkcd', exist_ok=True)    # ./xkcdに保存する

while not url.endswith('#'):
    # ページをダウンロードする
    print(f'ページをダウンロード中 {url}...')
    res = requests.get(url)
    res.raise_for_status()

    soup = bs4.BeautifulSoup(res.text)

    # コミック画像のURLを見つける
    comic_elem = soup.select('#comic img')
    if comic_elem == []:
        print('コミック画像が見つかりませんでした。')
    else:
        comic_url = 'http:' + comic_elem[0].get('src')
        # 画像をダウンロードする
        print(f'画像をダウンロード中 {comic_url}...')
        res = requests.get(comic_url)
        res.raise_for_status()

        # 画像を./xkcdに保存する
        with open(os.path.join('xkcd', os.path.basename(comic_url)), 'wb') as image_file:
            for chunk in res.iter_content(100000):
                image_file.write(chunk)
        
    # PrevボタンのURLを取得する
    prev_link = soup.select('a[rel="prev"]')[0]
    url = 'http://xkcd.com' + prev_link.get('href')

    time.sleep(20)

print('完了')
```

実行
```console
$ python3 11.6_DownloadXkcd.py 
ページをダウンロード中 http://xkcd.com/...
画像をダウンロード中 http://imgs.xkcd.com/comics/america_songs.png...
ページをダウンロード中 http://xkcd.com/2664/...
画像をダウンロード中 http://imgs.xkcd.com/comics/cloud_swirls.png...
ページをダウンロード中 http://xkcd.com/2663/...
画像をダウンロード中 http://imgs.xkcd.com/comics/tetherball_configurations.png...
ページをダウンロード中 http://xkcd.com/2662/...
画像をダウンロード中 http://imgs.xkcd.com/comics/physics_safety_tip.png...
ページをダウンロード中 http://xkcd.com/2661/...
画像をダウンロード中 http://imgs.xkcd.com/comics/age_milestone_privileges.png...
ページをダウンロード中 http://xkcd.com/2660/...
画像をダウンロード中 http://imgs.xkcd.com/comics/gen_z.png...
ページをダウンロード中 http://xkcd.com/2659/...
画像をダウンロード中 http://imgs.xkcd.com/comics/unreliable_connection.png...
ページをダウンロード中 http://xkcd.com/2658/...
画像をダウンロード中 http://imgs.xkcd.com/comics/coffee_cup_holes.png...
ページをダウンロード中 http://xkcd.com/2657/...
画像をダウンロード中 http://imgs.xkcd.com/comics/complex_vowels.png...
ページをダウンロード中 http://xkcd.com/2656/...
画像をダウンロード中 http://imgs.xkcd.com/comics/scientific_field_prefixes.png...
```

コミックをダウンロードすることができました  
例（画像はリンクから直接読み込んでいます）：  
<img src="http://imgs.xkcd.com/comics/america_songs.png" height="300px">
<img src="http://imgs.xkcd.com/comics/cloud_swirls.png" height="300px">

## 11.10 演習
### 11.10.1 コマンドライン電子メーラー
コマンドラインから電子メールアドレスと本文テキストを受け取り、電子メールを送信する  
引数 "\<address\> \<text\>"：アドレスとテキスト

プログラム（[11.10.1_CommandLineMailer.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/11/11.10.1_CommandLineMailer.py){:target="_blank"}）
```python
import time
import sys
from selenium import webdriver
from selenium.webdriver.common.by import By

def send_email(address, text):
    browser = webdriver.Chrome()
    browser.get('https://sute.jp/')

    MAIL_ADDRESS = 'c0l9tcja2q'
    input_text = browser.find_element(By.NAME, 'user[login]')
    input_text.send_keys(MAIL_ADDRESS)
    time.sleep(0.1)
    
    make_address = browser.find_element(By.CLASS_NAME, 'btn-warning')
    make_address.click()
    time.sleep(1)

    make_mail = browser.find_element(By.CLASS_NAME, 'btn-success')
    make_mail.click()
    time.sleep(1)

    input_address = browser.find_element(By.NAME, 'draft[to]')
    input_address.send_keys(address)
    time.sleep(0.1)

    input_text = browser.find_element(By.NAME, 'draft[body]')
    input_text.send_keys(text)
    time.sleep(3)

    send_mail = browser.find_element(By.NAME, 'button')
    send_mail.click()
    time.sleep(5)

    send_mail = browser.find_element(By.CLASS_NAME, 'confirm')
    send_mail.click()
    time.sleep(5)

if len(sys.argv) < 3:
    print('使い方：python3 11.10.1_CommandLineMailer.py 電子メールアドレス 本文テキスト')
else:
    send_email(sys.argv[1], ' '.join(sys.argv[2:]))
```

[https://sute.jp/](https://sute.jp/)
でメアドを２つ作成し、メールを送信しました

```console
$ python3 11.10.1_CommandLineMailer.py bk5h6t5109@sute.jp test mail
```

プログラムで送ったメールを受信することができました（悪用厳禁）  
![](/assets/images/blogs/python-boring-4/11.10.1.png)

### 11.10.2 画像サイトのダウンローダー
写真共有サイトFlickeで画像を検索し、検索結果の画像をすべてダウンロード  
引数 "\<keyword\>"：検索したいワード

プログラム（[11.10.2_Downloader.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/11/11.10.2_Downloader.py){:target="_blank"}）
```python
import os
import requests, sys, bs4, re

DIR = 'downloads'

url = 'https://www.flickr.com/search/?text=' + ' '.join(sys.argv[1:])
print(f'ページをダウンロード中 {url}...') # Googleページをダウンロード中にテキストを表示
res = requests.get(url)
res.raise_for_status()

# 上位の検索結果のリンクを取得する
soup = bs4.BeautifulSoup(res.text, 'html5lib')
link_elems = soup.select(".view .awake")
regex = re.findall(r'//.*\.jpg', str(link_elems))
if len(regex) == 0:
    print('画像が見つかりませんでした。')
else:
    os.makedirs(DIR, exist_ok=True)
    for i, reg in enumerate(regex):
        img_url = 'https:' + reg
        print(f'画像をダウンロード中 {img_url}...')
        res = requests.get(img_url)
        res.raise_for_status()

        with open(os.path.join(DIR, f'{i+1}_{os.path.basename(img_url)}'), 'wb') as image_file:
            for chunk in res.iter_content(100000):
                image_file.write(chunk)

print('完了')
```

実行
```console
$ python3 11.10.2_Downloader.py Japan
ページをダウンロード中 https://www.flickr.com/search/?text=Japan...
画像をダウンロード中 https://live.staticflickr.com/65535/7233537156_7546d38a71_n.jpg...
画像をダウンロード中 https://live.staticflickr.com/65535/50769174478_f618e20094.jpg...
画像をダウンロード中 https://live.staticflickr.com/65535/39325597891_b69989ab42.jpg...
画像をダウンロード中 https://live.staticflickr.com/65535/50770324997_16ba316b85_n.jpg...
画像をダウンロード中 https://live.staticflickr.com/65535/51216227505_d4e64ceeb1_w.jpg...
画像をダウンロード中 https://live.staticflickr.com/65535/50802096183_7a685f709e_w.jpg...
画像をダウンロード中 https://live.staticflickr.com/65535/50769170818_4f92565fc7_w.jpg...
画像をダウンロード中 https://live.staticflickr.com/476/31990069875_8d811676a0_w.jpg...
画像をダウンロード中 https://live.staticflickr.com/65535/50770219306_47571a0ccc_w.jpg...
画像をダウンロード中 https://live.staticflickr.com/65535/50769346926_ddb9cffa6f_w.jpg...
画像をダウンロード中 https://live.staticflickr.com/4591/39325572391_acfd87ab68_w.jpg...
画像をダウンロード中 https://live.staticflickr.com/773/31117610484_bfe9e1a43c_w.jpg...
画像をダウンロード中 https://live.staticflickr.com/65535/49267624826_375d2996ee_n.jpg...
画像をダウンロード中 https://live.staticflickr.com/65535/51215370313_b60132d2ce_n.jpg...
画像をダウンロード中 https://live.staticflickr.com/313/31604636710_ac45346519_n.jpg...
画像をダウンロード中 https://live.staticflickr.com/65535/31757464976_e446ce2c27_n.jpg...
画像をダウンロード中 https://live.staticflickr.com/4506/36981300983_da007674d8_w.jpg...
画像をダウンロード中 https://live.staticflickr.com/65535/50729177132_5324bc0a5f_w.jpg...
画像をダウンロード中 https://live.staticflickr.com/4505/37620021932_64e90ee51b_w.jpg...
画像をダウンロード中 https://live.staticflickr.com/65535/50777955348_f52fc4c132_w.jpg...
画像をダウンロード中 https://live.staticflickr.com/65535/50735464301_0a32b99529_w.jpg...
画像をダウンロード中 https://live.staticflickr.com/65535/49267862687_2870bf2b8c_w.jpg...
完了
```
「Japan」で検索した結果、日本っぽい富士山や建物の画像を取得することができました  
画像例（画像はリンクから直接読み込んでいます）：  
<img src="https://live.staticflickr.com/65535/7233537156_7546d38a71_n.jpg" height="150px">
<img src="https://live.staticflickr.com/65535/50769174478_f618e20094.jpg" height="150px">
<img src="https://live.staticflickr.com/65535/39325597891_b69989ab42.jpg" height="150px">

### 11.10.3 2048
2048というゲームを自動的に上右下左を繰り返し入力して遊ぶ

プログラム（[11.10.3_2048.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/11/11.10.3_2048.py){:target="_blank"}）
```python
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys

browser = webdriver.Chrome()
browser.get('https://play2048.co/')
html_elem = browser.find_element(By.TAG_NAME, 'html')
for i in range(100):
    html_elem.send_keys(Keys.UP)
    time.sleep(0.2)
    html_elem.send_keys(Keys.RIGHT)
    time.sleep(0.2)
    html_elem.send_keys(Keys.DOWN)
    time.sleep(0.2)
    html_elem.send_keys(Keys.LEFT)
    time.sleep(0.2)

browser.quit()
```

自動的に実行され、3008点を稼ぐことができました

<img src="/assets/images/blogs/python-boring-4/11.10.3_1.png" width="30%">
<img src="/assets/images/blogs/python-boring-4/11.10.3_2.png" width="30%">
<img src="/assets/images/blogs/python-boring-4/11.10.3_3.png" width="30%">

### 11.10.4 リンクの検査
指定したURLのページからリンクされたすべてのページをダウンロードする

プログラム（[11.10.4_LinkSearch.py](https://github.com/Absolute-Value/Automate-the-boring-stuff-with-python/blob/main/11/11.10.4_LinkSearch.py){:target="_blank"}）
```python
import requests, bs4, sys, os

def link_search(url, save_dir='Downloads'):
    os.makedirs(save_dir ,exist_ok=True)

    res = requests.get(url)
    res.raise_for_status()

    soup = bs4.BeautifulSoup(res.text, 'html5lib')
    links = soup.select("a")

    for link in links:
        href = link.get('href')
        if not href:
            continue

        try:
            res = requests.get(href)
        except:
            print(f'{href} はリンク切れです．')
            continue

        if not href.endswith('.html'):
            href += '.html'
        with open(os.path.join(save_dir, os.path.basename(href)), 'a') as f:
            f.write(res.text)
        print(f'{href}を{save_dir}に保存しました')
        
if len(sys.argv) < 1:
    print('URLを入力してください')

link_search(' '.join(sys.argv[1:]))
```

[このホームページのBlog](https://absolute-value.github.io/blogs)をダウンロードしてみます
```console
$ python3 11.10.4_LinkSearch.py https://absolute-value.github.io/blogs
/index はリンク切れです．
/index はリンク切れです．
/blogs はリンク切れです．
/notes はリンク切れです．
/posts はリンク切れです．
/blogs/python-boring-4.html はリンク切れです．
/blogs/python-boring-3.html はリンク切れです．
/blogs/python-boring-2.html はリンク切れです．
/blogs/python-boring-1.html はリンク切れです．
mailto:jikuya[at]cv.info.gifu-u.ac.jp はリンク切れです．
https://twitter.com/jky_kei.htmlをDownloadsに保存しました
https://github.com/Absolute-Value.htmlをDownloadsに保存しました
```
jekyllのせいか相対リンクになっていて拾えていませんね...  
twitterとgithubだけ正しくダウンロードできてました

# つづき
作成中...