---
title: "Egocentric Human-Object Interaction Detection Exploiting Synthetic Data"
date: "2022-09-05 00:00:00"
identifier: Unary-Pairwise-Transformer
category: HOI
hero: /assets/images/posts/EgocentricHOI/5.png
link: https://iplab.dmi.unict.it/EHOI_SYNTH/
tags: ["Human-Object Interaction Detection", "Dataset"]
conference: arXiv
year: 2022
math: true
layout: post
---

# 概要

産業環境（電気基板のテストおよび修理作業）においてHOI検出を行う際に、大量のデータの収集・ラベリングは困難である。そこで、自動的にラベリングされた合成一人称画像を生成するパイプラインとツールを提案する。生成した合成データで事前学習をし、実データでファインチューニングをすることで、実データでのHOI検出の性能を向上させた。
<!--more-->

# 新規性・差分

- 産業界を対象とした手と物体のラベルやセグメンテーションを含む、HOI検出用の合成一人称データセットを提示
- Understanding human hands in contact at internet scale (CVPR 2020)を全ての物体を検出できるように拡張した手法を提案
- 合成データの有用性を実験でベースライン手法と比較

# アイデア

- 合成データの作成
    - ![](/assets/images/posts/EgocentricHOI/1.png)
    - 3Dスキャナ(対象物：Artec Eva 5, 環境：MatterPort 6)を用いて物体や環境の3Dモデルを取得
    - 3Dモデルから、RGB画像・深度マップ・セグメンテーション・物体のBBとカテゴリ・手のBBとオブジェクトとの接触状態を生成するツールをBlenderで作成した
        - ![](/assets/images/posts/EgocentricHOI/2.png)
        - カメラ位置・照明 ・手の色など、仮想シーンをカスタマイズして自動撮影することも可能
- 実データの作成
    - 7人の被験者の工業用実験室での電気基板の試験・修理作業を8本、Microsoft Hololens 2を用いて撮影し、手動でアノテーション
    - 操作をMRで指示（操作に一貫性を持たせ、自然に行うため）
- HOI検出手法
    - ![](/assets/images/posts/EgocentricHOI/3.png)
    - Understanding human hands in contact at internet scale (CVPR 2020)を基本に、画像中の全ての物体を検出するようにした
        - Faster RCNNベースの手法
        - ResNet101がBackbone
        - ![](/assets/images/posts/EgocentricHOI/4.png)
    - Hand side classification module
        - 左右の手のどちらかを予測
    - Hand state classification module
        - 手が物体と接触しているかを予測
    - Offset vector regression module
        - 手のBBと物体のBBの中心をリンクさせるOffset vectorを予測
    - RGB 画像から、物体のカテゴリ・手の側面・手の接触状態・HOIを<手、 接触状態、アクティブ物体、<他の物体>>の4重項として推論

# 結果

![](/assets/images/posts/EgocentricHOI/5.png)

- 物体検出性能
    - ![](/assets/images/posts/EgocentricHOI/6.png)
    - 事前学習にSynthetic（合成データ）を使用し、実データ50%でファインチューニングした結果が1位
    - 事前学習にSynthetic（合成データ）を使用し、実データ100%でファインチューニングした結果が2位
- HOI検出性能（データ配分比較）
    - ![](/assets/images/posts/EgocentricHOI/7.png)
    
    - 事前学習にSynthetic（合成データ）を使用し、実データ100%でファインチューニングした結果がほとんどで1位
- HOI検出性能（既存手法との比較）
    - [](/assets/images/posts/EgocentricHOI/8.png)
    - 物体には強いが、合成データの手のリアリティが低いためか性能が低い
        - BS1：単一オブジェクト
        - BS2：実データからのサンプリング画像
        - BS3：合成データ
        - BS4：合成データと実データ両方
        - BS5：YOLOv5でラベリング