---
title: シューティングゲーム
date: "2023-03-20 00:00:00"
update: "2023-03-20 00:00:00"
category: "Blog"
hero: https://image.itmedia.co.jp/news/articles/2212/01/l_tm1636144_2212012_1_w490.jpg
tags: ["JavaScript"]
layout: blog
excerpt: JavaScriptでシューティングゲームをChatGPTに作ってもらいました
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

<a href="https://chat.openai.com/chat" target="_blank">ChatGPT</a>くん（AI）にJavascriptでシューティングを作ってもらいました．  
初期位置からすぐに移動しないと殺される鬼畜仕様です．（このページに入った瞬間殺されます）  
矢印キーで左右に移動できます．敵を避けることしかできません...  
これをもとに，まともに遊べるシューティングを実装していこうと考えています．  

<canvas id="canvas"></canvas>
<script src="js/ShootingGame.js"></script>