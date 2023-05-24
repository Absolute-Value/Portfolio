---
title: "Unified-IO: A Unified Model for Vision, Language, and Multi-Modal Tasks"
date: "2023-05-08 12:00:00"
identifier: Unified-IO
category: Vision and Language
hero: /assets/images/posts/Unified-IO/Unified-IO-1.png
link: https://unified-io.allenai.org/
tags: ["Multimodal Pretraining", "Multitask Learning", "Unified Frameworks", "Zero-shot Learning", "Vision and Language"]
conference: ICLR
year: 2023
math: true
layout: post
---

# 概要

- 統一された入力と出力を使用して、姿勢推定、物体検出、深度推定、画像生成などのCVタスク、領域キャプションや参照表現などのVLタスク、質問応答やテキスト要約などのNLタスクを実行する統合モデルUNIFIED-IOを提案
- UNIFIED-IOは、単一のtransformerベースのアーキテクチャを使用して、CVとNLの90を超える多様なデータセットを共同でトレーニングできる
- GRITベンチマークで7つのタスクすべてを実行できる最初のモデルであり、NYUv2-Depth、ImageNet、VQA2.0、OK-VQA、Swig、VizWizGround、BoolQ、およびSciTailなどの16の多様なベンチマークでタスク固有のFinetuningなしで優れた結果
<!--more-->

# 新規性・差分

- モダリティ固有のブランチを必要とせずに、GRITベンチマークで7つのタスクをサポートする最初のモデル

# アイデア

![](/assets/images/posts/Unified-IO/Unified-IO-2.png)
- アーキテクチャ
    - Text-to-Text Transfer Transformer (T5)に従って、基本は純粋なTransformer Encoder-Decoder構造
    - 画像はViTに倣ってパッチトークンにし、2次元絶対位置埋め込みを追加
    - 入力は言語256画像576トークン(384x384画像から24x24パッチ)で、出力は言語128画像256トークン(256x256画像から16x16パッチ)
    - パラメータ
        - ![](/assets/images/posts/Unified-IO/Unified-IO-3.png)
        
- 学習
    - 2つの事前学習
        - 言語のノイズ除去(BERTと同様)
            - 半分がテキストデータ(C4とWikipedia)
            - 残りがImagenet21kなどの画像とクラスデータや、YFCC15Mなどの画像とキャプションデータ
        - 画像のマスクノイズ除去(MAEと同様)
            - CVデータの一部の画像を使用
    - 学習とデータセット
        - 62箇所から95の公開データセットを使用
            - ![](/assets/images/posts/Unified-IO/Unified-IO-4.png)
            - ![](/assets/images/posts/Unified-IO/Unified-IO-5.png)
        - バッチにデータセットを混ぜて訓練
            - データの多い画像合成は3/16、少ない密度ラベリングは1/16、それ以外はグループで均等
            - グループ内ではデータセットサイズの平方根に比例してサンプリング
            - 一部のタスクはめったにサンプリングされない（深度推定は0.43％）
- 語彙
    - 言語が32152，場所が1000，画像が16384の計49536

# 結果

- GRIT ベンチマーク
    - 画像分類、物体検出、VQA、参照表現、セグメンテーション、キーポイント、および表面法線推定など7つのタスクで構成
    - 既存で最も多いGPV-2が4タスクしかできないのに対し、UNIFIED-IOは7つのタスクすべてをサポート
    - UNIFIED-IO XLは画像分類、VQA、参照表現、セグメンテーションにおいてSOTA
    - キーポイントはMask R-CNNより劣っている（推論が二段階のため）
        - ![](/assets/images/posts/Unified-IO/Unified-IO-6.png)
        
- Detection
    - ![](/assets/images/posts/Unified-IO/Unified-IO-7.png)
    - ![](/assets/images/posts/Unified-IO/Unified-IO-8.png)
    - ![](/assets/images/posts/Unified-IO/Unified-IO-9.png)

- Reration
    - ![](/assets/images/posts/Unified-IO/Unified-IO-10.png)
    
- Other
    - ![](/assets/images/posts/Unified-IO/Unified-IO-11.png)
    - ![](/assets/images/posts/Unified-IO/Unified-IO-12.png)
    - ![](/assets/images/posts/Unified-IO/Unified-IO-13.png)
    