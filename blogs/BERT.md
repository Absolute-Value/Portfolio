---
title: "BERTで遊ぶ"
date: "2023-02-16 21:00:00"
update: "2023-02-16 21:00:00"
category: "Blog"
hero: https://www.keywalker.co.jp/wp-content/uploads/2020/04/Google-Bert.png
tags: ["BERT", "pytorch", "python"]
math: true
layout: blog
excerpt: BERTを用いて翻訳をしてみました．
toc: true
---

# BERT
BERTを用いて「日本語」を「英語」に翻訳をして遊んでみます．

## ライブラリのインストール
Google Colaboratory上などpytorchがインストールされている前提です．
まず，pipを用いて必要なライブラリをインストールします．(Colab上では!をつけてください)

```console
pip install transformers
```

## プログラム
ライブラリをインポートします．
```python
import torch
from transformers import AutoTokenizer, AutoModelForSeq2SeqLM
```

GPUが使える場合はGPUを使用します．
```python
if torch.cuda.is_available():
  device = 'cuda'
else:
  device = 'cpu'
print(f'device : {device}')
```

tokenizerとモデルを読み込みます．
```python
tokenizer = AutoTokenizer.from_pretrained("Helsinki-NLP/opus-mt-ja-en")
model = AutoModelForSeq2SeqLM.from_pretrained("Helsinki-NLP/opus-mt-ja-en")
model.to(device)
```

翻訳をする関数を定義します．
```python
def translation(japanese_text = "こんにちは、私の名前は太郎です。"):
  # 日本語文章をトークナイズする
  input_ids = tokenizer.encode(japanese_text, return_tensors="pt")

  # BERTを使用して日本語から英語に翻訳する
  output = model.generate(input_ids.to(device))

  # 翻訳された英語文章をデコードする
  english_text = tokenizer.decode(output[0], skip_special_tokens=True)
  print(english_text)
```

関数に翻訳したい文字列を入力します．
```python
translation('リポジトリはセキュリティの都合上，非公開です．')
```

翻訳された文章が出力されます．
```console
Repositories are confidential for security purposes.
```

普通に有用なので，これを用いてホームページの英語化を進めようか検討中です．

## 全プログラムはコチラ
<script src="https://gist.github.com/Absolute-Value/fc4b6bce731df7f9fe45cd9b72ba04d7.js"></script>