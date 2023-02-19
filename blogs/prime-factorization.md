---
title: "素因数分解プログラム"
date: "2022-09-04 13:00:00"
update: "2023-02-19 16:00:00"
category: "Blog"
hero: /assets/images/note.jpg
tags: ["python", "java", "c"]
math: true
layout: blog
excerpt: 素因数分解を様々なプログラミング言語で実装しました
toc: true
---

# はじめに

個別塾のバイト中に素因数分解を教えていて，  
「素因数分解は繰り返しのためコンピュータが処理を得意そう」  
と感じたためプログラムを実装してみました

# python
まずはpythonです

<script src="https://gist.github.com/Absolute-Value/6e204cce0c69918307c62bd73880f6f6.js"></script>


実行
```console
$ python3 PrimeFactorization.py
素因数分解したい整数を入力してください：1024
[2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
```

1024を素因数分解することができました

# java
続いて、同じ内容をjavaでやってみました

<script src="https://gist.github.com/Absolute-Value/cb20aed233bdf6903fcb48b094e928f3.js"></script>

出力
```console
$ javac PrimeFactorization.java
$ java PrimeFactorization
素因数分解したい整数を入力してください：1024
[2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
```
先にコンパイルするの懐かしいです  
変数や配列や関数の型の指定の不要なpythonって楽な言語だと改めて実感しました

# C
c言語でもやってみました

<script src="https://gist.github.com/Absolute-Value/95b83107e869fd4f16a68f62535ddf4f.js"></script>

実行
```console
$ gcc PrimeFactorization.c -o app   
$ ./app
素因数分解したい整数を入力してください：1024
[2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
```

c言語での可変配列がよくわからなかったので、因数を順番にprintfで出力するようにしました  
printfですら型の指定が必要なCは大変ですね...  
実行は速いですが...（この程度のプログラムじゃ差はない）

# 追記（高速化）

AtCoderでプログラミングをして遊んでいたところ，素因数分解の問題が出てきたので，  
お！そのまま使えるやん！と上記のプログラムをしたところ...

<a href='https://atcoder.jp/contests/math-and-algorithm/submissions/39000792?lang=ja'><img src='/assets/images/blogs/prime-factorization/before.png' height=300></a>

上のように「遅すぎwwww」と煽られてしまったので，
整数$n$の因数は$\sqrt{N}$までしかないことを活用して高速化してみました．（関数化はしておらず，表示のために数字をstringで保存しています．）

<script src="https://gist.github.com/Absolute-Value/587490086a9177dd6e43d28be6fb77e0.js"></script>

<a href='https://atcoder.jp/contests/math-and-algorithm/submissions/39001296?lang=ja'><img src='/assets/images/blogs/prime-factorization/after.png' height=300></a>

AtCoderくんもご満悦です🤗