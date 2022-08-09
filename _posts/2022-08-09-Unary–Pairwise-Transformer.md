---
title: "Efficient Two-Stage Detection of Human–Object Interactionswith a Novel Unary–Pairwise Transformer"
date: "2022-08-09 00:00:00"
identifier: Unary-Pairwise-Transformer
category: HOI
hero: /assets/images/posts/Unary–Pairwise-Transformer/1.png
link: https://fredzzhang.com/unary-pairwise-transformers/
tags: ["Human-Object Interaction Detection", "Transformer"]
conference: CVPR
year: 2022
math: true
layout: post
---

# 概要

- DETRの出力特徴量にHOI分類用のtransformer層を追加した2段階モデルを提案
- 最新の手法を凌駕し、学習時間とメモリ消費量を大幅に削減
<!--more-->

# 新規性・差分

- 2段階HOI検出器で、2段階ともtransformerを使用
    - 1段階目にDETRを使用したSCGは存在する

# アイデア

![](/assets/images/posts/Unary–Pairwise-Transformer/1.png)
- Backbone CNNで抽出した特徴をパッチに分割し、positional encodingをしてDETRのencoder–decoderへ入力し、新たな特徴を得る
    - この特徴をMLPに入力することで、バウンディングボックスとクラスラベルを得る
        ![](/assets/images/posts/Unary–Pairwise-Transformer/2.png)
        
- さらにこの特徴をUnaryトークンとしてInteraction Headに渡す
    ![](/assets/images/posts/Unary–Pairwise-Transformer/3.png)
    
- Interaction Headは2種類のtransformer encoderから成り、第1層は協力層と呼ばれ正解のHOIスコアを増加させる
    - すでに位置情報は含んでいるため、バウンディングボックスを使用してペアの空間情報を入れるようなpositional encodingを行う
    - しかし、通常のpositional encodingの与え方ではうまくいかないため、下図のようなencoderへ変更をした
        - $X$：Unary token
        - $Y$：positional encoding
    - ![](/assets/images/posts/Unary–Pairwise-Transformer/4.png)
        
- 第2層は競争層と呼ばれ、不正解のHOIスコアを減少させる
    - 第2層に入力する前に、第1層の出力の人と物体以外のペアを削除し、マルチブランチフージョンでペアとなる人と物体のトークンとpositional encodingを融合してPairwiseトークンにする
    ![](/assets/images/posts/Unary–Pairwise-Transformer/5.png)
        
- 最後にMLPに入力することでHOI分類を行う
    - 物体検出を活用するため、最終スコアには人と物体の信頼度を掛け合わせる

# 結果

- HICO-DETとV-COCO
    - 軽量なResNet-50でほとんどのカテゴリで既存手法を上回っており、ResNet-101を使用すると全てのカテゴリで既存手法を上回る
        - ![](/assets/images/posts/Unary–Pairwise-Transformer/6.png)
        - ![](/assets/images/posts/Unary–Pairwise-Transformer/7.png)
    - ResNet第5層の畳み込みのストライドをなくすと、特徴マップが高解像度になり、小さな物体に対する性能が向上する(DETR)