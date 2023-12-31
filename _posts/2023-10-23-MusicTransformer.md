---
title: "Music Transformer: Generating music with long-term structure"
date: "2023-10-23 20:14:00"
identifier: MusicTransformer
category: Transformer
hero: /assets/images/posts/MusicTransformer/0.png
link: https://magenta.tensorflow.org/music-transformer
tags: ["Attention", "Transformer"]
conference: ICLR
year: 2019
math: true
layout: post
---

# 概要

- 音楽の長期構造を生成するためのMusic Transformerを提案
- Music Transformerは既存のTransformerモデルの相対位置情報の表現を改善し、音楽の相対的なタイミングとピッチを捉えることができる
- データセット「JSB Chorales」と「Piano-e-Competition」で評価され、後者で最先端の結果を達成
<!--more-->

# 新規性・差分

- Transformerを用いて長期構造を持つ音楽を生成する初の成功例で、LSTMを超えた
- 提案アルゴリズムは、相対的自己注意メカニズムの空間複雑さを大幅に削減し、より長い音楽構造の生成を可能にしている

# アイデア

- Relative positional self-attention
    - Shawらによって提案されたもの
        - ![](/assets/images/posts/MusicTransformer/1.png)
        
- Skewing
    - LxDの相対埋め込みE（学習パラメータ）がある
    - ShawらはEからLxLxDの埋め込みに拡張しQをかけることでSを作成 O($L^2D$)
    - SkewingではEに直接Qをかけて、図下のような変形をすることで効率化 O($LD$)
        - ![](/assets/images/posts/MusicTransformer/2.png)
        
- Relative local attention
    - 非常に長い文の場合にすべてのAttentionをとるのは非現実的
    - Mブロックにわけた長さNに対してAttentionをとる
    - その場合のSkewingは、図のような変形
        - ![](/assets/images/posts/MusicTransformer/3.png)
        

# 結果

- ShawらのRelative Attentionとのメモリ使用量の比較
    - ![](/assets/images/posts/MusicTransformer/4.png)
    
- J.S.Bach Chorales
    - ![](/assets/images/posts/MusicTransformer/5.png)
    
- Piano-e-Competition dataset
    - ![](/assets/images/posts/MusicTransformer/6.png)