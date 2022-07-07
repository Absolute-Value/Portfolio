---
title: "Portrait Neural Radiance Fields from a Single Image"
date: 2022-05-13
category: NeRF
identifier: PortraitNeRF
category: NeRF
hero: /assets/images/posts/PortraitNeRF/1.png
link: https://portrait-nerf.github.io
tags: ["NeRF", "Meta Learning", "Sparse Views"]
conference: arXiv
year: 2020
math: true
layout: post
---

## 概要

- メタ学習を活用した1枚の顔写真からのNeRF生成
    - 顔だけでなく、頭頂部、髪、胴体、眼鏡などのアクセサリを含む
- 世界座標からの剛体変換を用いて、顔空間においてNeRFを事前学習させるアルゴリズムを提案
    - 学習データ間の形状のばらつき補正により、未見の被験者に対するモデルの汎化が大幅に改善
- 照明ステージでの制御されたキャプチャからなる多視点ポートレートデータセットを提供
<!--more-->

## アイデア
![](/assets/images/posts/PortraitNeRF/2.png)

### 事前学習
![](/assets/images/posts/PortraitNeRF/3.png)
- 学習データは正面のサポートセット$D_s$と他の角度$D_q$に分かれている
- 被験者$m$ごとに
    - まず、$D_s$を用いて$\theta_{p,m}$を更新して$\theta^*_m$を取得 (1)
    - 続いて、$D_q$を用いて， $ {\theta}^{*}_{m} $ を更新するときの勾配情報 $ \nabla_{\theta} L_{D_{q}}(f_{\theta_{m}}) $ を取得 (2)
        - 正面以外の勾配更新情報
    - 勾配情報$ \nabla_\theta L_{D_q}(f_{\theta_m}) $を$ \theta_{p,m} $に適用することで新たなパラメータ$\theta_{p,m+1}$を得る (3)
        - 正面情報はテスト時に入力されるため直接勾配更新はしない
    - すべての被験者$m$に繰り返して学習終了、パラメータ$\theta^*_p$を得る

### 剛体変換
- 顔のメッシュを用いて、World座標から標準顔座標への剛体変換を学習する
    - 顔のメッシュ(b)を平均顔(d)の頂点の対応を用いている  
    ![](/assets/images/posts/PortraitNeRF/4.png)
- World座標そのままの(b)に比べて標準顔座標を用いた(c)では顎と目がより自然になっている  
![](/assets/images/posts/PortraitNeRF/5.png)

### テスト
- 1つの画像で事前学習したパラメータ$\theta^*_p$をファインチューニングし、色と密度を求めてボリュームレンダリングすることで画像を生成

## 結果

- 最新手法との比較  
![](/assets/images/posts/PortraitNeRF/6.png)  
![](/assets/images/posts/PortraitNeRF/7.png)