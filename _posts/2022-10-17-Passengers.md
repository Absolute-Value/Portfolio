---
title: "Correlating Belongings with Passengers in a Simulated Airport Security Checkpoint"
date: "2022-10-17 00:00:00"
identifier: Passengers
category: "Object Detection"
hero: /assets/images/posts/Passengers/6.png
link: https://dl.acm.org/doi/abs/10.1145/3243394.3243703
tags: ["Object Detection", "Tracking"]
conference: ICDSC
year: 2018
math: true
layout: post
---

# 概要
- 空港の保安検査場における乗客と持ち物のトラッキング・関連付けのアルゴリズムを提示し、その有効性を実証
- 手作業とディープラーニングベースのアプローチの両方を活用
- 現実のデータセットで、乗客と持ち物を検出、トラッキング、関連付けることができた
<!--more-->

# 新規性・差分

- 自然光があり実世界に近く、物があり複雑な空港監視システムにおける初めての追跡と関連付け

# アイデア

![](/assets/images/posts/Passengers/1.png)
- 乗客の検出とトラッキング
    - オプティカルフローでフローが閾値以上の画素を得ることで、乗客の位置を荒く推定
    - Faster R-CNNで精密な位置をバウンディングボックスで得る
    - オプティカルフローの大きさと方向で移動方向を予測し、トラッキング
    - ![](/assets/images/posts/Passengers/2.png)
        
- 持ち物の検出とトラッキング
    - はじめビン（持ち物を入れる容器）は灰色で背景は暗いので、強度の変化で検出できる
    - 一意のIDとバウンディングボックスを割り当てる
    - 相関フィルタでモデル化し畳み込みで追跡
        - Background Aware Correlation Filterを採用
            - ターゲットの周囲の背景をネガティブサンプルとして使用
    - Best-Buddies Similarity (BBS) テンプレートマッチングでビン内に離脱物があるか判定
        - ビンの色の急激な変化（乗客の手や日陰に入ることが原因）に対応するため
        - 類似度が閾値以下で空と判定
        - ![](/assets/images/posts/Passengers/3.png)
        
- 乗客と持ち物（ビン）の関連付け
    - 単純な距離だと、複数の乗客が近接していると失敗する
    - カメラ2（置く）
        - VGG19の特徴量で上半身をポーズ推定
        - 手のひらの座標がビンに最も近い乗客を追跡
        - ビンから離れたときに、最も手が近い乗客を所有者に割り当て
            - 所有者以外がビンを一時的に移動させた際に対応
    - カメラ4（拾う）
        - 手のひらの座標がビンに最も近い乗客を受取人に
            - その際に受取人のラベルが所有者と同じかを判定
    - ![](/assets/images/posts/Passengers/4.png)
        

# 結果

- 結果
    - 評価方法
        - PD：全イベントのうち、正しく検出できたもの↑
        - PFA：全イベントのうち、誤って検出したもの↓
        - Switch：乗客か持ち物のラベルに変更があったか↓
        - Mismatch：乗客と持ち物の関連付けが不一致↓
    - 対象
        - PAX：乗客
        - DVI：持ち物
        - XFR：記載なし
    - - ![](/assets/images/posts/Passengers/5.png)
- 評価結果の例
    - 見方
        - 緑：GT
        - 赤：アルゴリズムの予測
        - 黄色：アルゴリズムの間違い
    - フレーム
        - (a)~(c)：正しく検出
        - (d)~(e)：乗客の誤検出（見切れているもの）
        - (f)：ビンの見落とし（出てきたばかりのため）
    - ![](/assets/images/posts/Passengers/6.png)