---
title: "Lane Detection: A Survey with New Results"
date: "2022-12-12 12:00:00"
identifier: LaneDetectionSurvey
category: "Lane Detection"
hero: /assets/images/posts/LaneDetectionSurvey/img29.png
link: https://link.springer.com/article/10.1007/s11390-020-0476-4
tags: ["Lane Detection"]
conference: JCST
year: 2020
math: true
layout: post
---

# 概要

- 視覚に基づく車線検出のデータセット、深層学習を用いた手法の比較
- HD地図のモデリングに向けた新しいデータセット（TTLane）と複雑な道路状況での自立走行に向けた方向性とLineNetを紹介する

# 新規性・差分

- 全車線の検出とHD地図のモデリングに向けた新しいデータセット（TTLane）
- 複雑な道路状況下での正確な車線検出のための新しい深層CNN手法、LineNetを提案

# アイデア

- データセット
    - ![](/assets/images/posts/LaneDetectionSurvey/img1.png)
    - KITTI  road
        - 全車線と現在走行している車線「（エゴレーン）の二種類のアノテーション
    - ELAS
        - エゴレーン＋レーンマーキングタイプ（LMT）
        - 20以上の異なるシーン（15,000フレーム以上）
    - Caltech Lanes
        - 都市環境における4つのビデオ
        - 1225枚の画像
    - BDD100K
        - 車線が走行方向と平行か否かを示すアノテーション付き
    - VPGNet
        - 4つのシナリオ、8種類の車線マーキング、9種類の道路マーキング
        - 約20,000枚
        - すべての車線にアノテーション
    - tuSimple lane challenge
        - 高速道路で撮影された3626枚の学習画像と2782枚のテスト画像
        - 車線の種類を区別しない
        - 破線の車線を実線と表記
    - CULane
        - 複数車線検出の最大のデータセット
        - 現在走っている道路のアノテーションしかない＋道路境界のアノテーションがない
        - HD地図のモデリングに向いてない
    - TTLane Dataset
        - ![](/assets/images/posts/LaneDetectionSurvey/img2.png)
        - 全車線の検出とHD地図のモデリングに向けたデータセット
        - 晴天から雨天まで、異なる光の条件と天候
        - 全ての車線にアノテーション
        - LMT（白実線、白破線、黄実線、黄破線、二重線）
            - 破線の間にもアノテーション
            - 実践と破線の組み合わせもできる
        - 中心点は手動、連続はベジェ曲線でフィッティング
        - 13200枚のうち3000枚にオクルージョン情報
            - クルマで重なって見えない部分
        - 分離帯などは「その他」
            - ![](/assets/images/posts/LaneDetectionSurvey/img3.png)
            - ![](/assets/images/posts/LaneDetectionSurvey/img4.png)
            
- 手法
    - 共通の課題：光線状態、天候状態、オクルージョン
    - エゴレーン（現在走行している車線）検出
        - 車線逸脱警報（LDWS）やレーンセンタリングで用いられる
        - リアルタイム性能が要求される
        - シングルタスク（車線検出のみの手法）
            - Efficient Deep Models for Monocular Road Segmentation
                - ![](/assets/images/posts/LaneDetectionSurvey/img5.png)
                - VGGベースのエンコーダ・デコーダネットワーク
            - Drivable Road Detection Based on Dilated FPN with Feature Aggregation
                ![](/assets/images/posts/LaneDetectionSurvey/img6.png)
                
                - 特徴ピラミッドネットワーク（FPN）
                - KITTIで最高のF1
            - Road Segmentation Using CNN and Distributed LSTM
                - CNN+LSTMによるセグメンテーション
                - ![](/assets/images/posts/LaneDetectionSurvey/img7.png)
                - ![](/assets/images/posts/LaneDetectionSurvey/img8.png)
            
        - マルチタスク（車線検出以外にも道路分類、車線検出、パラメータ回帰）
            - RBNet: A Deep Neural Network for Unified Road and Road Boundary Detection
                - ![](/assets/images/posts/LaneDetectionSurvey/img9.png)
                - 道路と道路境界検出
                - ResNet50で特徴抽出し、3つのタスクをサブネットで検出
            - Estimating High Definition Map Parameters with Convolutional Neural Networks
                - ![](/assets/images/posts/LaneDetectionSurvey/img10.png)
                - マルチタスクCNN
                - 道路の種類，車線数，路側，角度などのパラメータを推定
                    - HD地図に必須
                - ナビから生成された強度マップ、意味マップ、占有グリッドマップが必要
            - MultiNet: Real-time joint semantic reasoning for autonomous driving
                - ![](/assets/images/posts/LaneDetectionSurvey/img11.png)
                - 道路分類、車両検出、道路セグメンテーションを同時に行うエンドツーエンドのマルチタスクアーキテクチャ
                - 共有の3層CNN Encoderの特徴を入力とし、3つのDecoderで予測
                - リアルタイム性能を達成
        - エゴ・ロードレーン（走行方向の道路にある全てのレーン）検出
            - 課題：道路幅の変化により、レーン数が変化することがある
                - インスタンスセグメンテーションとみなされる
            - End-to-end方式
                - 個々の車線を直接出力
                - VPGNet: Vanishing point guided network for lane and road marking detection and recognition
                    - ![](/assets/images/posts/LaneDetectionSurvey/img12.png)
                    - 車線と道路標識の同時検出を行うマルチタスクCNN
                    - 車線の消失点を利用
                    - Caltech Lanesで最高のF1
                - Spatial as deep: Spatial CNN for traffic scene understanding
                    - ![](/assets/images/posts/LaneDetectionSurvey/img13.png)
                    - 空間CNN（SCNN）というレイヤーを提案
                    - 行／列に沿ったメッセージの受け渡し、受容野を画像全体に拡大
                    - 車線が画像上で交差している可能性があるため、車線認識に有効
                    - あらかじめ定義された数の車線しか検出することができない
                - SpinNet: Spinning convolutional network for lane boundary detection
                    - ![](/assets/images/posts/LaneDetectionSurvey/img14.png)
                    - 多くの情報を収集するために回転畳み込み層を導入
                    - 特徴マップから車線曲線を回帰する車線境界パラメータ化技でEnd-to-end
                - Learning lightweight lane detection CNNs by self attention distillation
                    - ![](/assets/images/posts/LaneDetectionSurvey/img15.png)
                    - 隣接する2 つの ENet Encoder間の自己注意を学習し、固定数のレーンをセグメント化する新しいモジュールSelf Attention Distillation (SAD)を提案
                - Lane Detection and Classification using Cascaded CNNs
                    - ![](/assets/images/posts/LaneDetectionSurvey/img16.png)
                    - インスタンスセグメンテーションネットワークと分類ネットワークをカスケード接続
                - FastDraw: Addressing the long tail of lane detection by adapting a sequential prediction network
                    - ![](/assets/images/posts/LaneDetectionSurvey/img17.png)
                    - セグメンテーションの代わりにResNet-50を適応し、
                    複数の車線の表現を自動回帰させ、
                    道路上の任意の数の車線を検出できるように
            - 車線標識を見つけるセグメントネットワーク＋
            車線インスタンスを得るためのクラスタリングや車線曲線フィット
                - Semantic instance segmentation with a discriminative loss function
                    - ![](/assets/images/posts/LaneDetectionSurvey/img18.png)
                    - ResNet38の特徴を高速なポスト処理によって特徴をクラスタリング
                - Towards end-to-end lane detection: An instance segmentation approach
                    - ![](/assets/images/posts/LaneDetectionSurvey/img19.png)
                    - ![](/assets/images/posts/LaneDetectionSurvey/img20.png)
                    - 車線分割サブネットワーク、上記手法と同様の画素埋め込みサブネットワーク、および透視変換ネットワークからなる複雑なネットワークを提案
                    - 最後に透視変換の各車線のインスタンスに対し、3次多項式
                - Learning to Cluster for Proposal-Free Instance Segmentation
                    - ![](/assets/images/posts/LaneDetectionSurvey/img21.png)
                    - セグメンテーションネットワークを利用し、車線と車線の特徴を同時に見つける
                    - 後処理でクラスタリング
                - Multi-lane detection using instance segmentation and attentive voting
                    - ![](/assets/images/posts/LaneDetectionSurvey/img22.png)
                    - 複雑な気象条件で収集された独自の市道データセットに対して車線分割ネットワークを学習
                    - その後、教師なしクラスタリング
        - 全車線検出
            - 自立走行において曲がる可能性がある十字路、HD地図のモデリングなどで必要
            - エゴレーン検出用の手法
                - Efficient Deep Models for Monocular Road Segmentation
                - RBNet: A Deep Neural Network for Unified Road and Road Boundary Detection
                - MultiNet: Real-time joint semantic reasoning for autonomous driving
                - オクルージョンの影響を受けやすく、車線境界の種類も無視
                - 入力画像が前方視であるため，消失点に向かってレーンマークが細く小さくなり，識別しづらい
            - より多くのモダリティとの組み合わせ
                - Accurate and robust lane detection based on dual-view convolutional neutral network
                    - ![](/assets/images/posts/LaneDetectionSurvey/img23.png)
                    - 前方視と鳥瞰図を組み合わせた
                - 3D-laneNet: End-to-end 3D multiple lane detection
                    - ![](/assets/images/posts/LaneDetectionSurvey/img24.png)
                    - 前方視と鳥瞰図を利用して、道路平面 と3DレーンをEnd-to-endで予測
                - Deep multi-sensor lane detection
                    - ![](/assets/images/posts/LaneDetectionSurvey/img25.png)
                    - LiDARとRGBカメラの組み合わせによる予測
                    - 3D LiDARで接地面の高さと角度を予測
                    - 予測されたパラメータを使用して、画像を鳥瞰図に再投影
                - HD maps: Finegrained road segmentation by parsing ground and aerial images
                    ![](/assets/images/posts/LaneDetectionSurvey/img26.png)
                    - 航空写真を使って、すべての道路を認識しモデル化
                - Aerial LaneNet: Lane Marking Semantic Segmentation in Aerial Imagery using Wavelet-Enhanced Cost-sensitive Symmetric Fully Convolutional Neural Networks
                    - ![](/assets/images/posts/LaneDetectionSurvey/img27.png)
                    - Encoder Decoderでリモートセンシング画像内のすべての車線をセグメンテーション
                - Deep learning segmentation and 3D reconstruction of road markings using multiview aerial imagery
                    - ![](/assets/images/posts/LaneDetectionSurvey/img28.png)
                    - 上の研究に基づいて、マルチビュー航空写真から高精細な写真を再構成
- 学習型車線検出の動向
    - ロバスト性（晴れでも曇りでも、昼でも夜でも、夏でも冬でも、都会でも田舎でも、渋滞でも晴れでも、1年を通して車線検出する）のために
        - 多くのモダリティ
            - LiDAR、赤外線画像、航空写真、パノラマ画像の利用
        - 汎用性の向上
            - データセットに制約されていて汎化されてない
            - 転送学習や実世界の道路情報を示す、より一般的なデータセットの検討
        - 3D車線検出
            - 2次元では曲がる際や合流する際に不可欠な距離情報が欠落
        - マルチタスク
            - 自律走行システムのためのネットワーク負荷を軽減するために、複数タスクを同時の行うネットワークが必要
        - 半教師ありや教師なし学習の利用
- LineNet
    - ![](/assets/images/posts/LaneDetectionSurvey/img29.png)
    - 既存のCNNベースの手法は画像分類タスク用ネットワークを使用していて、白泉検出には適さない
    - 事前学習済みDeepLabを基幹とし、Line Prediction(LP)層とZoomモジュールを含む
    - Line Prediction(LP)層
        - マスク層、位置層、方向層、信頼度層、距離層、およびタイプ層の6層から成る
            - ![](/assets/images/posts/LaneDetectionSurvey/img30.png)
    - Zoomモジュール
        - ![](/assets/images/posts/LaneDetectionSurvey/img31.png)
        - 低解像度画像における結果が信頼できない領域を、サムネイルCNNと高解像度トリミングCNNの2つに分割
            - 重みと特徴を共有
            - サムネイルCNNはグローバル特徴、高解像度トリミングCNNは詳細に「見る」
        - 生成した離散的な点をDBSCANを用いてクラスタリングし線に
        - 滑らかで信頼性の高い線を車線検出結果として得る

# 結果

- Caltech Lanes
    - ![](/assets/images/posts/LaneDetectionSurvey/img32.png)
- CULane
    - ![](/assets/images/posts/LaneDetectionSurvey/img33.png)
    
- TTLane
    - ![](/assets/images/posts/LaneDetectionSurvey/img34.png)
    - ![](/assets/images/posts/LaneDetectionSurvey/img35.png)
    - (a)原画像 (b)(c)正解 (d)SCNN (e)Mask E-CNN (f)MLD-CRF (g)LineNet
        - LineNetは二重線検出や複雑なシーンにも強い
            - ![](/assets/images/posts/LaneDetectionSurvey/img36.png)
            
- HD地図モデリング
    - クラウドソーシングで収集した画像と GPS 情報から地図を生成
    - 車線の平均誤差がGPSの5mから31.3cmへと大幅に改善
        ![](/assets/images/posts/LaneDetectionSurvey/img37.png)