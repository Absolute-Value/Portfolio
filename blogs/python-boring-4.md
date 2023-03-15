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

<script src="https://gist.github.com/Absolute-Value/04d2b49dd897ef05ce1d6e2e0176b488.js"></script>

出力
```console
$ python3 10.5.7_coinFlip.py 
半分完了！
表は511回出ました
```

## 10.8 演習
### 10.8.1 コイン投げゲームをデバッグする
コインを投げて裏と表を当てるゲームにバグがあるため、バグを見つける   

<script src="https://gist.github.com/Absolute-Value/4667a6cefaba87a86d4fdf05d26e267d.js"></script>

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

<script src="https://gist.github.com/Absolute-Value/a52675e16dcf0a83398877a41380b522.js"></script>

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

<script src="https://gist.github.com/Absolute-Value/f07aa5c47c3cfe266f46c35151229511.js"></script>

「870 Valencia St, San Francisco, CA 94110」を検索します
```console
$ python3 11.1_mapIt.py 870 Valencia St, San Francisco, CA 94110
```

Googleマップで開くことができました  
![](/blogs/images/python-boring-4/11.1.png)  

## 11.5 Google検索 "I'm Feeling Lucky"
コマンドラインからGoogle検索をし、上位の検索結果をタブに開く  
引数 "\<keyword\>"：検索したいワード

<script src="https://gist.github.com/Absolute-Value/b04c8ebdc35f833e04cae44b52fa594f.js"></script>

「python」でGoogle検索をします
```console
$ python3 11.5_lucky.py python       
Googling...
```
「python」での上位検索5つをタブで開くことができました  
![](/blogs/images/python-boring-4/11.5.png)

## 11.6 XKCDコミックをダウンロードする
XKCDコミックをひとつずつダウンロードする

<script src="https://gist.github.com/Absolute-Value/271b3874e8d98fcfa34db635273fd429.js"></script>

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

<script src="https://gist.github.com/Absolute-Value/c462213f90f95d0d497ca605b720dcda.js"></script>

[https://sute.jp/](https://sute.jp/)
でメアドを２つ作成し、メールを送信しました

```console
$ python3 11.10.1_CommandLineMailer.py bk5h6t5109@sute.jp test mail
```

プログラムで送ったメールを受信することができました（悪用厳禁）  
![](/blogs/images/python-boring-4/11.10.1.png)

### 11.10.2 画像サイトのダウンローダー
写真共有サイトFlickeで画像を検索し、検索結果の画像をすべてダウンロード  
引数 "\<keyword\>"：検索したいワード

<script src="https://gist.github.com/Absolute-Value/2c05add46590a2aeba752ed4df479373.js"></script>

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

<script src="https://gist.github.com/Absolute-Value/110fdc08f7907bd3d69bf5a0b59b3971.js"></script>

自動的に実行され、3008点を稼ぐことができました

<img src="/blogs/images/python-boring-4/11.10.3_1.png" width="30%">
<img src="/blogs/images/python-boring-4/11.10.3_2.png" width="30%">
<img src="/blogs/images/python-boring-4/11.10.3_3.png" width="30%">

### 11.10.4 リンクの検査
指定したURLのページからリンクされたすべてのページをダウンロードする

<script src="https://gist.github.com/Absolute-Value/9678c6d6863ed5e8f84b55b17d7fca32.js"></script>

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