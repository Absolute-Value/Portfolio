---
title: シューティングゲーム2
date: "2023-03-20 01:00:00"
update: "2023-03-22 02:00:00"
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
矢印キーで左右に移動，xキーで弾を発射できます．

<canvas id="canvas"></canvas>
<script src="js/config.js"></script>
<script src="js/ShootingGame2.js"></script>