---
title: 野球ゲーム
date: "2023-05-31 00:00:00"
update: "2023-05-31 00:00:00"
category: "Blog"
hero: https://cdn.pixabay.com/photo/2016/11/22/22/17/action-1850887_1280.jpg
tags: ["JavaScript"]
layout: blog
excerpt: '<span style="color: #42b983;">[遊べます！] </span>Pythonで作った野球ゲームをJavaScriptに移植しました．'
---

学生の特権を使ってGithub PROアカウントになり，Github Copilotを試してたら楽しくなって作ってしまった<a href="https://github.com/Absolute-Value/BaseBallGame" target="_blank"><b>コチラ</b></a>の野球ゲームのpythonコードをJavaScriptに移行してみました．  
このまま遊べると思います．操作方法はゲームの下にあります．

<a href="https://github.com/Absolute-Value/BaseBallJS" target="_blank"><b>Github リポジトリ</b></a>

<head>
  <meta charset="utf-8">
    <style>
      #GameCanvas {
        margin: 1% 5%;
      }
    </style>
</head>

<script src="https://cdn.jsdelivr.net/npm/p5@1.6.0/lib/p5.js"></script>
<script src="https://absolute-value.github.io/BaseBallJS/js/main.js"></script>
<div id="GameCanvas"></div>

## 操作方法 | Controls

| キー | 説明 |
| --- | --- |
| w / up | 上へ移動 |
| s / down | 下へ移動 |
| a / left | 左へ移動 |
| d / right | 右へ移動 |
| N | 長押しでスイング、途中で離すことでバント |