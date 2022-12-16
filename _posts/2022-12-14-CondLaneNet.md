---
title: "CondLaneNet: a Top-to-down Lane Detection Framework Based on Conditional Convolution"
date: "2022-12-14 12:00:00"
identifier: LineNet
category: "Lane Detection"
hero: /assets/images/posts/CondLaneNet/img2.png
link: https://github.com/aliyun/conditional-lane-detection
tags: ["Lane Detection"]
conference: ICCV
year: 2021
math: true
layout: post
---

# 概要

- 既存の車線検出は密集線や分岐線のような複雑な場合に苦労している
    - ![](/assets/images/posts/CondLaneNet/img1.png)
- 車線を検出し、次に各車線の形状を予測する車線検出フレームワークであるCondLaneNetを提案
- 3つのベンチマークデータセットで最先端手法を凌駕

# 新規性・差分

- 密集線や分岐線などの複雑な車線を検出する問題を克服
- CULaneでは78.14 F1スコアと220 FPSを達成するなど，精度と効率の両立が可能

# アイデア

- ![](/assets/images/posts/CondLaneNet/img2.png)
- 事前学習済みResNetをBackboneとしてFPNを用いて、マルチスケール特徴を得る
    - 車線は細長いため、文脈特徴の抽出のためにBackboneの最終層にTransformer Encoderを追加
        - ![](/assets/images/posts/CondLaneNet/img3.png)
- Proposal head
    - 線の始点を予測する
        - CenterNetに従うが、細長い線は中心を見つけることが難しいため始点
- Recurrent Instance Module
    - ![](/assets/images/posts/CondLaneNet/img4.png)
    - 予測した始点の特徴量から動的カーネルパラメータを再帰的に予測
    - 密な線や複数の線が同一の始点から始まる場合(ex.分岐)に対応
- Conditional shape head
    - RIMの動的カーネルパラメータを使って畳み込み、マルチスケール特徴から各線の形状を予測
        - ![](/assets/images/posts/CondLaneNet/img5.png)  
    - Location maps：行ごと列ごとに予測
    - Offset maps：行ごとの水平方向の正確な位置を予測

# 結果

- 可視化
    - 上からCurveLanes、CULane、TuSimple
        - ![](/assets/images/posts/CondLaneNet/img6.png)  

- CurveLanes
    - ![](/assets/images/posts/CondLaneNet/img7.png)
- CULane
    - ![](/assets/images/posts/CondLaneNet/img8.png)
- TuSimple
    - ![](/assets/images/posts/CondLaneNet/img9.png)