---
title: "tmux 個人的メモ"
date: "2022-11-17 14:00:00"
update: "2023-05-24 22:00:00"
category: "Note"
hero: /notes/images/tmux/tmux.png
tags: ["Memo", "tmux"]
layout: note
excerpt: tmuxに役立ちそうな個人的メモです。
toc: true
---

# はじめに

tmuxに役立ちそうな個人的メモです。
tmuxを使用することで、  
ssh接続を終了してもプログラムを動かし続けてログを残すことができる、  
並列で処理を行うことができるなどのメリットがあります。

# 起動と終了

```bash
# 新規セッション開始（セッション名は0）
tmux

# 名前をつけて新規セッション開始
tmux new -s <セッション名>

# セッションの一覧表示
tmux ls

# セッションを再開 ※-t <対象セッション名>でセッション名の指定も可能
tmux a
```

# キー操作
はじめにPrefix（デフォルトだとCtrl+B）でキー操作モードにしてから、以下のキーを入力して操作を行う。

## セッション操作

| キー操作 | 説明 |
| - | - |
| d | セッションから離脱(動かしたまま抜けるときはこれを使う) |
| t | 時計を表示 |

## ウインドウ操作

| キー操作 | 説明 |
| - | - |
| c | 新規ウインドウ作成 |
| w | ウインドウの一覧選択 |
| 0-9 |  指定番号のウインドウへ移動|
| p | 前のウインドウへ移動 |
| n | 次のウインドウへ移動 |
| , | ウィンドウの名前を変更 |
| : | 以下のコマンド操作の前に打つ |

| コマンド操作 | 説明 |
| - | - |
| :join-pane -t [session名]:<windowインデックス値> | 新規ウインドウ作成 |

## ペイン操作

| キー操作 | 説明 |
| - | - |
| % | 左右にペイン分割 |
| " | 上下にペイン分割 |
| ! | ペインを解除してウインドウ化 |
| ↑↓←→ | 指定方向のペインへ移動 |
| o | ペインを順に移動 |
| ; | 以前のペインへ移動 |
| SPACE | レイアウトを変更 |

# tmux.confの変更
.tmux.confを編集し、ホームディレクトリに配置することで、以下のようにtmuxをカスタマイズすることができます。

![](/notes/images/tmux/tmux.png)

## カスタマイズ例

.tmux.conf
<script src="https://gist.github.com/Absolute-Value/616203b77258c4ccc0f4b28bd5d22faf.js"></script>

# tmuxのサイズが小さくなってしまう場合の対処法
tmuxのサイズが他の接続端末のサイズに合わせて小さくなってしまった場合に  
他の端末の接続を切って、大きさを現在の画面に合わせるには以下を実行

```bash
tmux attach -t <セッション名> -d
```

# 参考になるURL
- [tmuxチートシート](https://qiita.com/nmrmsys/items/03f97f5eabec18a3a18b){:target="_blank"}
- [.tmux.confの設定](https://qiita.com/youichiro/items/dd54c38c2f3873348c78){:target="_blank"}
- [tmux の status line の設定方法](https://qiita.com/nojima/items/9bc576c922da3604a72b){:target="_blank"}