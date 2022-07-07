---
title: "An Empirical Investigation of 3D Anomaly Detection and Segmentation"
date: 2022-04-15
identifier: MVTec3DADSeg
category: "Anomaly Detection"
hero: /assets/images/posts/MVTec3DADSeg/1.png
link: https://www.vision.huji.ac.il/3d_ads/
tags: ["Anomaly Detection", "Unsupervised Learning", "Anomaly Segmentation"]
conference: arXiv
year: 2022
math: true
layout: post
---

## 概要

- MVTec 3D-ADに対して以下の4つを調査した
    - 「3D手法>2D手法」か
    - 3D情報は必要か
    - 3D手法について広範囲の調査
        - HoGなど古典的な方法含む
    - 3Dと2D(色)の併用は必要か
<!--more-->

## 新規性・差分

• MVTec 3D-ADを作成したMVTec以外で初めて調査

## 手法

- PatchCore
- NSA
- Histogram of Oriented Gradients (HoG)
- Dense Scale-Invariant Feature Transform (D-SIFT)
- Fast Point Feature Histograms (FPFH)

## 結果

- 「3D手法>2D手法」か
    - 2D手法(PatchCore)が3D手法(Voxel GAN)を超えた  
    ![](/assets/images/posts/MVTec3DADSeg/2.png)
    
- 3D情報は必要か
    - 特定の方向からしか発見できないデータがある  
    ![](/assets/images/posts/MVTec3DADSeg/3.png)
    
- 3D手法について広範囲の調査
    - FPFHが最良  
    ![](/assets/images/posts/MVTec3DADSeg/4.png)
    
- 3Dと2D(色)の併用は必要か
    - 3D(FPFH)と2D(PatchCore)がかなり有用
        - PRO  
        ![](/assets/images/posts/MVTec3DADSeg/5.png)
            
        - I-ROCAUC  
        ![](/assets/images/posts/MVTec3DADSeg/6.png)