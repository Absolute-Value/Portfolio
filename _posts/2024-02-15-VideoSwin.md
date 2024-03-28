---
title: "Video Swin Transformer"
date: "2024-02-15 12:00:00"
identifier: MusicTransformer
category: Dataset
hero: /assets/images/posts/VideoSwin/3.png
link: https://github.com/SwinTransformer/Video-Swin-Transformer
tags: ["Action Recognition", "Transformer"]
conference: CVPR
year: 2022
math: true
layout: post
---

# 概要

- 既存のビデオモデルは、空間的・時間的次元にわたってパッチをグローバルに接続するTransformer Layerを使用
- 提案ビデオアーキテクチャは局所性の帰納バイアスを持ち、従来のアプローチに比べて速度と精度のトレードオフを改善
- 小さな事前学習データセットとモデルサイズを使用しながらも、Kinetics-400とKinetics-600とSomething-Something v2でSoTA
<!--more-->

# 新規性・差分

- ビデオ認識においてCNNからTransformerへのモデリングシフト

# アイデア

- ![](/assets/images/posts/VideoSwin/1.png)
- 各フレームの3Dパッチをトークンとする
- 線形埋め込み層で任意の次元に東映
- Video Swin Transformer blocks
    - SwinTransformerのMSAモジュールを3D shifted windowsに基づくMSAモジュールに置き換え
        - ![](/assets/images/posts/VideoSwin/2.png)
    - 3D shifted windows
        - ![](/assets/images/posts/VideoSwin/3.png)

# 結果

- Kinetics-400
    - 84.9%(SoTA)
    - ![](/assets/images/posts/VideoSwin/4.png)

- Kinetics-600
    - 86.1%(SoTA)
    - ![](/assets/images/posts/VideoSwin/5.png)
    
- Something-Something v2
    - 69.6%(SoTA)
    - ![](/assets/images/posts/VideoSwin/6.png)
