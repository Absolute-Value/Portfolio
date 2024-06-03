---
title: "ReConPatch : Contrastive Patch Representation Learning for Industrial Anomaly Detection"
date: "2024-03-28 15:37:00"
identifier: ReConPatch
category: Transformer
hero: /assets/images/posts/ReConPatch/1.png
link: https://arxiv.org/abs/2305.16713v3
tags: ["Anomaly Detection"]
conference: WACV
year: 2024
math: true
layout: post
---

# 概要

- 既存手法では、自然画像データセットから事前に学習した視覚表現を活用しているため、産業データセットへの適用にはギャップが存在
- 事前学習モデルからのパッチ特徴の線形変調を訓練し、コントラスト表現学習を用いて異常検出のための識別的特徴を構築
- MVTec ADデータセットおよびBTADデータセットにおける最先端の異常検出性能
<!--more-->

# 新規性・差分

- ペアワイズおよびコンテクスト類似性を疑似ラベルとして活用し、ラベルのないデータに対するコントラスト学習を可能にした

# アイデア

- ![](/assets/images/posts/ReConPatch/1.png)
- 学習
    - 訓練データを事前学習済みCNNに通して特徴マップを収集
        - 異なる空間解像度は同じ解像度に補間して連結
    - 特定のパッチサイズ内の近傍の特徴ベクトルを集約し、パッチレベルの特徴を生成
    - 特徴表現学習のための2つのネットワーク
        1. パッチレベルの特徴表現学習用
        2. パッチレベルの特徴ペア間のペアワイズおよびコンテクスト類似性を計算
    - relaxed contrastive lossに基づいて、特徴表現層と射影層を訓練
        - 似た特徴が近づき、異なる特徴が遠ざかるように学習
        - ![](/assets/images/posts/ReConPatch/2.png)
- テスト
    - 事前学習済みCNNに通して特徴マップを収集
    - メモリバンク内の代表的な特徴との比較によりピクセルごとの異常スコアを計**算**
    - 画像レベルの異常スコアは画像内のすべてのパッチ特徴に対して計算された異常スコアの最大値

# 結果

- MVTec AD
    - ![](/assets/images/posts/ReConPatch/3.png)
    - ![](/assets/images/posts/ReConPatch/4.png)
- BTAD
    - ![](/assets/images/posts/ReConPatch/5.png)