---
title: "Detecting and Recognizing Human-Object Interactions"
date: "2022-07-22 18:00:00"
identifier: InteractNet
category: HOI
hero: /assets/images/posts/InteractNet/1.png
link: https://gkioxari.github.io/InteractNet/index.html
tags: ["Human-Object Interaction Detection", "Dataset"]
conference: CVPR
year: 2018
math: true
layout: post
---

# 概要

- 人物を中心としたHuman-Object InteractionモデルInteractNetを提案
- 人物の領域から対象物体の位置推定を行うことで物体の探索空間を狭めた
- V-COCOとHICO-DETデータセットにおいて性能向上、1画像あたり135msで実行可能
<!--more-->

# 新規性・差分

- 人間の外観を使うことで物体の探索空間を減らし、精度向上かつ高速化

# 手法

![](/assets/images/posts/InteractNet/1.png)

- Object Detection branch
    - Faster-RCNNと同様にして、RoiAliginで特徴を抽出し、人$s_h$と物体$s_o$のクラス分類と領域の予測を行う
- Human-centric branch
    - 以下の二つの役割を持つ
    1. Object Detection branchと同様に、人間についてRoiAliginで特徴を抽出し、人間の行動$s^a_h$をマルチクラス分類（人間は同時に様々な行動を行うことができるため）
    2. 人間の外観から目標物の位置を予測したいが、正確な位置の予測は難しい
        - そこで、人間についてRoiAliginで特徴を抽出し、目標物の位置に対する密度(下画像の赤で可視化)をガウス関数でモデル化し、その平均位置$\mu^a_h$を予測  
        ![](/assets/images/posts/InteractNet/2.png)
- Interaction branch
    - 人間と物体の外観を考慮するため、人間と物体についてRoiAliginで特徴を抽出し合計することで、Human-Object Interactionの行動$s^a_{h,o}$のクラス分類を行う

# 結果

- V-COCO
    - 26%改善（3.18AP → 40AP）  
    ![](/assets/images/posts/InteractNet/3.png)
    - 一つの画像に一つのHOI  
    ![](/assets/images/posts/InteractNet/4.png)
    - 一つの画像に複数のHOI  
    ![](/assets/images/posts/InteractNet/5.png)
        
- HICO-DET
    - 27%改善  
    ![](/assets/images/posts/InteractNet/6.png)
    ![](/assets/images/posts/InteractNet/7.png)