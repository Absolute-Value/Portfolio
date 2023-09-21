---
title: シューティングゲーム2
date: "2023-03-20 01:00:00"
update: "2023-09-22 00:00:00"
category: "Blog"
hero: /assets/images/FiShooting.png
tags: ["JavaScript"]
layout: blog
excerpt: '<span style="color: #42b983;">[遊べます！] </span>ChatGPTに作ってもら作ってもらったシューティングゲームを修正しました．'
---

<head>
  <meta charset="utf-8">
    <style>
      #canvas {
        width: 640px;
        height: 480px;
        border: 2px solid #999;
        margin-left: 5%;
      }
    </style>
</head>

<a href="https://chat.openai.com/chat" target="_blank">ChatGPT</a>くん（AI）に作ってもらった[<b>シューティングゲーム</b>]({{ 'blogs/ShootingGame' | relative_url }})を修正しました。  
<span style="color: #42b983;">[2023/09/22]Javaのシューティングゲームを元に改良しました</span>  
矢印キーで上下左右に移動，xキーで弾を発射できます．

<a href="https://github.com/Absolute-Value/ShootingGameJS" target="_blank"><b>Github リポジトリ</b></a>

<canvas id="canvas"></canvas>
<script src="https://absolute-value.github.io/ShootingGameJS/config.js"></script>
<script src="https://absolute-value.github.io/ShootingGameJS/ShootingGame.js"></script>