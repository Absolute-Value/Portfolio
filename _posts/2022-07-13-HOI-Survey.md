---
title: "Human-Object Interaction Detection: A Quick Survey and Examination of Methods"
date: "2022-07-13 00:00:00"
identifier: HOI-Survey
category: HOI
hero: /assets/images/posts/HOI-Survey/10.png
link: https://arxiv.org/abs/2009.12950
tags: ["Human-Object Interaction Detection", "Survey"]
conference: ACM Multimedia
year: 2020
math: true
layout: post
---

# 概要

- Human-Object Interaction Detection(HOI)分野についてサーベイ
- HOI分野の基礎研究であるHORCNNアーキテクチャを検証
- HOI分野のベースラインとして一般的に使用されているHICO-DETデータセットを分析
<!--more-->

# 新規性・差分

- Human-Object Interaction Detectionにおける初めてのサーベイ論文

# 手法

- Multi-stream convolutional neural networks
    - 複数のCNNでHOIをクラス分類
    - Human-Object Region-based Convolutional Neural Networks
    (HORCNN)
        - ![](/assets/images/posts/HOI-Survey/1.png)
        - RCNNで物体検出し、3つのStramで使用
            - Human Stream
                - RCNNが検出した人間の領域を切り取ってリサイズし、それをCNNでベクトルに
            - Object Stream
                - RCNNが検出した物体の領域を切り取ってリサイズし、それをCNNでベクトルに
            - Pairwise Stream
                - RCNNが検出した人間と物体を含む領域で切り取りリサイズし、それをCNNでベクトルに
            - CNNとはImageNetで事前学習されたCaffeNet
        - 3つのStreamで作成したベクトルを足し合わせることでクラススコアを予測
    - InteractNet
        - ![](/assets/images/posts/HOI-Survey/2.png)
        - Faster R-CNNで物体検出し、3つブランチで使用
            - object detection branch
                - 予測した物体の領域の特徴量をRoiAlignで切り取ってリサイズし、1024dのNNでバウンディングボックスと人と物体のクラススコアを予測
            - human-centric branch
                - 予測した人間の領域の特徴量をRoiAlignで切り取ってリサイズし、1024dのNNで人間の行動ラベルと対応する物体の場所の確率密度を予測
            - interaction branch
                - 予測した物体と人間の領域の特徴量をRoiAlignで切り取ってリサイズし、1024dのNNで人間と物体の相互関係のラベルを予測
    - Instance Centric Attention Network (iCAN)
        - ![](/assets/images/posts/HOI-Survey/3.png)
        - ![](/assets/images/posts/HOI-Survey/4.png)
        - 基本はHORCNNと同じで、Human StreamとObject StreamにおいてCNNの代わりにAttentionを使用
    - Transferable Interactiveness Network（TIN）
        - ![](/assets/images/posts/HOI-Survey/5.png)
        - HORCNNにIntract度を計算するInteractiveness Moduleを追加
            - HORCNNの三つのモジュールに加えてポーズ推定を入力とし、Intract度を計算
    - Pose-aware Multilevel Feature Network（PMFNet）
        - ![](/assets/images/posts/HOI-Survey/6.png)
        - Faster R-CNNを用いて人、物体、ユニオン（相互作用領域）を検出し、 CNNを用いて取得した外観特徴と
        CPNポーズ推定器を用いて取得したポーズをHolistic ModuleとZoom-in Moduleに入力する
        - Holistic Module
            - オブジェクトレベルと関連するコンテキスト情報を取得する
            - 人間、オブジェクト、ユニオン、空間構成の4つのストリームから構成
            - これらを連結して全体的な特徴表現を得る
        - Zoom-in Module
            - 人体部位の特徴から、きめ細かい情報を抽出する
            - 人体部位ごとの外観特徴・空間構成特徴、関連するAttentionを抽出する
        - Fusion Module
            - Holistic Moduleの全体的特徴とZoom-in Moduleの局所的特徴の両方からHOIスコアを算出
    - Intention Driven Human-Object Interaction Detection（iHOI）
        - Faster-RCNNで人間と物を検出し、以下の３つのstreamへ
        - 人間と物をそれぞれ特徴抽出するseparate streams
        - 人間と物を一緒に特徴抽出するpairwise stream
        - 人体の関節位置と視線から人間の焦点を推測するgaze driven context-aware branch
        - これら３つを組み合わせて予測
    - Cascaded HOI
        - 言語の事前分布、幾何学的特徴、視覚特徴を組み込んだネットワーク
            - 視覚特徴には姿勢推定徳亮だけでなく視線キューも使用する
    - Parallel Point Detection and Matching (PPDM)
        - 空間的特徴を使用し、砂時計型のニューラルネットワークのバックボーンを実装
        - HICO-DETで高性能
- Graph Neural Networks
    - 人間と物をノードとし、エッジが関係を表すシーングラフで相互作用を表現
    - Graph Parsing Neural Network (GPNN)
        - 人間と物をすべて結び、存在しない関係を削除する
    - Relation Parsing Neural Network (RPNN)
        - ![](/assets/images/posts/HOI-Survey/7.png)
        - object body part graph
            - 体の部位と周囲の物の関係を予測
        - human body part graph
            - 人間と体の部位から行動を予測
        - HICO-DETとV-COCOで高性能
    - VS-GAT
        - 意味的情報と視覚情報との二重グラフ戦略
        - HICO-DETで最高mAP
- 弱教師あり
    - HOIのデータセットは一般的な例が一般的ではない例よりも多く存在するロングテール分布のため弱教師やゼロショットに向いている
    - HICOではテストされていない
        - ゼロショット：Weaklysupervised learning of visual relations
        - 弱教師あり：Weakly supervised learning of interactions between humans and objects
    - Visual Compositional Learning (VCL)
        - ![](/assets/images/posts/HOI-Survey/8.png)
        - 人間と物のBBの和から動詞とクラスの特徴を抽出している
    - Detecting Human-Object Interactions via Functional Generalization
        - word2vecを用いて物体間の類似性を出し、インタラクションの可能性を出す
- データセット
    - ![](/assets/images/posts/HOI-Survey/9.png)
    - HICO
        - MS-COCOの80物体カテゴリとよく使用される動詞で600個のインタラクションカテゴリを作成
        - 画像単位で予測すればよいだけという問題がある
            - 多人数のうち、一人を検出すればよい
    - HICO-DET (HICO with Detection)
        - HICOを拡張して、出てくるすべての人間と物に対してラベルがつけられている
    - V-COCO (verbs in COCO)
        - MS-COCOの物体クラスだけでなく、COCOの画像を使用して、26個のインタラクションカテゴリを作成
    - HCVRD
        - 1824種の物体のラベルとBBと物体の関係が含まれているVisual Genomeデータセットから抽出した
        - 類似性の高い動作を１つのインタラクションカテゴリに結合した
    - UnRel
        - 人間と物の非現実的なインタラクション
        - ゼロショットや弱教師ありに役立つ可能性がある
- 評価指標
    - mAP
        - 「Known Object」
            - 未知の画像とあいまいな画像をスキップする
            - 「Rare」データが10個未満
        - HICOとHICO-DET
        - V-COCO
            - agent検出
                - 行動をしている人間を検出
            - role検出
                - インタラクションに参加している人間と物を検出
        - HCVRD
            - 述語認識
                - インタラクションを検出
            - Phrase検出
                - インタラクションと、人間と物を包括するBBを予測
            - 関係性検出
                - 人間と物をローカライズ＋Phrase検出

# 結果

- HICO-DETにはラベル付けされていないインタラクションがあった
    - ![](/assets/images/posts/HOI-Survey/10.png)
    - 人間とグラスのholdされていない
- 人間の映っていないデータがあった
    - ![](/assets/images/posts/HOI-Survey/11.png)
- HICO-DETのmAP比較
    - ![](/assets/images/posts/HOI-Survey/12.png)
- V-COCOのAP比較
    - ![](/assets/images/posts/HOI-Survey/13.png)