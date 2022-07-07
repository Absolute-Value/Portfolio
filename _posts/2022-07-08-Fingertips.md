---
title: "Affine transformation of virtual 3D object using 2D localization of fingertips"
date: 2022-07-08
identifier: Fingertips
category: VR
hero: /assets/images/posts/Fingertips/hero.png
link: https://www.sciencedirect.com/science/article/pii/S2096579620300917
tags: ["Virtual Reality", "Affine transformation", "Detection of fingertips", "Detection of hand", "Human-computer interaction"]
conference: Virtual Reality & Intelligent Hardware
year: 2020
math: true
layout: post
---

## 概要

- VR環境のオブジェクトの指先での操作を目指す
- 手の検出と指先の検出の２段階CNNを用いて、親指と人差し指のジェスチャーを検出
- ジェスチャーでVR環境内の物体をアフィン変換
<!--more-->

## 新規性・差分
- 指先を2Dカメラで撮影し，AR/VR/MR空間のオブジェクトの操作が可能に

## 手法

![](/assets/images/posts/Fingertips/1.png)
- 指先検出システム
  - Hand Detection
    - 物体検出モデル(YOLO)で手を検出
  - Cropped & Resized
    - 手の領域で切り取り、指定のサイズに
  - Feature Learning
    - 分類モデル(VGG-16, InceptionV3, Xception, MobileNetV2)の特徴マップを平滑化し、NNで(親指のx,y座標, 人差し指のx,y座標)を出力するように学習

![](/assets/images/posts/Fingertips/2.png)
- Vuforiaを使用したインタラクションシステム
  - 手の検出
  - 指の検出
  - 指の距離、角度、重心を計算
  - 計算値からVRオブジェクトをアフィン変換（拡大縮小、回転、平行移動）

## 結果

- 分類モデルごとの性能比較
  - VGG16の損失関数(Loss)と座標の平均絶対誤差(MAE)が最小 = 最も良い
  ![](/assets/images/posts/Fingertips/3.png)
  ![](/assets/images/posts/Fingertips/4.png)

- 既存の指先検出手法との比較
  - 提案手法(Proposed Method)の座標のMAEが最小 = 最も良い
  - ただし、ネットワークが重いため一番遅い
  - 30FPSの33.33msは下回っているため問題なし  
  ![](/assets/images/posts/Fingertips/5.png)

- オブジェクト操作のリアルタイムデモ
  - 拡大縮小、回転、平行移動  
  ![](https://user-images.githubusercontent.com/37298971/78501859-96a26b00-777f-11ea-9f33-977ea8feda09.gif)