---
title: "Anaconda 環境構築 個人的メモ"
date: 2022-05-10
category: "Note"
hero: https://www.python.jp/install/anaconda.png
tags: ["Memo", "Anaconda"]
math: true
layout: note
excerpt: Anacondaの環境構築に役立ちそうな個人的メモです。
---

Anacondaの環境構築に役立ちそうな個人的メモです。

<!--more-->
## 仮想環境の確認

```console
$ conda info -e
```

## 仮想環境の作成

```console
$ conda create -n <name> (python=<version>)
```

name に環境名、version に好きなバージョン (例：python=3.7)

```console
$ conda create -n <name> anaconda
```
のように末に anaconda を付けると、  
Anacondaの全部のライブラリをインストールできる

- matplotlib
- pillow
- pip
- tqdm

など

## 仮想環境の起動

```console
$ source activate <name>
```

## 仮想環境の削除

```console
$ conda remove -n <name> --all
```

## 仮想環境一覧の表示

```console
$ conda env list
```

## 環境の保存と再構築
### 同じOS・アーキテクチャの場合

pip での requirements.txt の作り方
```console
$ pip freeze > requirements.txt
```

conda での requirements.txt の作り方
```console
$ conda list -e > conda_requirements.txt
```

新規再構築
```console
$ conda create -n <name> --file requirements.txt
```

既存環境への再構築
```console
$ conda install -n <name> --file requirements.txt
```

# 別のOS・アーキテクチャの場合

conda での requirements.txt の作り方
```console
$ conda env export -n <name> > requirements.txt
```

再構築
```console
$ conda env create -f=requirements.txt
```