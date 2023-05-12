---
title: "BPEの実装"
date: "2023-05-12 10:00:00"
update: "2023-05-12 10:00:00"
category: "Blog"
hero: /assets/images/posts/BPE/0.png
tags: ["BPE", "python"]
math: true
layout: blog
excerpt: BPEを実装しました。
toc: true
---

論文「Neural Machine Translation of Rare Words with Subword Units」
（解説は[コチラ]({% post_url 2023-05-04-BPE %})）
のBPEアルゴリズムをpythonで実装したので、保存用に貼っておきます。

<script src="https://gist.github.com/Absolute-Value/f13fc63cbc0233e965efe817831352c4.js"></script>

実行
```console
$ python3 BPE.py
before: {'l o w </w>': 5, 'l o w e s t </w>': 2, 'n e w e r </w>': 6, 'w i d e r </w>': 3}
1 : ('e', 'r')
2 : ('er', '</w>')
3 : ('l', 'o')
4 : ('lo', 'w')
after: {'low </w>': 5, 'low e s t </w>': 2, 'n e w er</w>': 6, 'w i d er</w>': 3}
```