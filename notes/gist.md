---
title: "Github Gistでのコード表示"
date: "2023-02-14 21:00:00"
update: "2023-02-14 21:00:00"
category: "Note"
hero: /assets/images/note.jpg
tags: ["Github", "Gist"]
math: true
layout: note
excerpt: 「GitHub Gist」を使ってコードを載せてみた所、綺麗に表示することができたのでご紹介します．
toc: true
---

「GitHub Gist」を使ってコードを載せてみた所，
綺麗に表示することができたのでご紹介します．

# 使い方

[<b>https://gist.github.com/</b>](https://gist.github.com/){:target="_blank"}にコードをあげます．

上部にあるEmbedに書かれている下記のようなScriptをダウンロードします．

```html
<script src="https://gist.github.com/Absolute-Value/6fe45442837193d88913d67f611692d0.js"></script>
```

これをHtmlやMarkDownに入れるだけでコードの表示ができます．  
以下がその例です．

<script src="https://gist.github.com/Absolute-Value/6fe45442837193d88913d67f611692d0.js"></script>

行数が表示されて見やすいですね！

## 表示の改良

実はデフォルトだと真っ白で<s>正直ダサく</s>，ダークモードだと眩しいので，cssを編集することで色を変えることができます．

### 背景の色を変える場合
<script src="https://gist.github.com/Absolute-Value/2a7e333669037eed48d8a4e2d4f04e7b.js"></script>

### コード内の文字の色を変える場合
<script src="https://gist.github.com/Absolute-Value/5f00de426f3ab9d566edd160a7dd7160.js"></script>

上端と下端が白くなっているので，気が向いたら修正します．