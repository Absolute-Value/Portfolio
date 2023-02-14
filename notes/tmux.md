---
title: "tmux 個人的メモ"
date: "2022-11-17 14:00:00"
update: "2022-11-17 14:00:00"
category: "Note"
hero: /assets/images/notes/tmux/tmux.png
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
# 新規セッション開始
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

![](/assets/images/notes/tmux/tmux.png)

## カスタマイズ例

.tmux.conf
```config
#マウス操作を有効にする
set-option -g mouse on

# prefix+r で設定のリロード
bind r source-file ~/.tmux.conf \; display "Reloaded!"

# windowのインデックスを1から始める
set -g base-index 1

# 256色カラーをセット
set-option -g default-terminal screen-256color
set -g terminal-overrides 'xterm:colors=256'

# ステータスライン の背景色を指定する。
set-option -g status-bg "colour130"

# ステータスライン の文字色を指定する。
set-option -g status-fg "colour255"

# status-left の最大の長さを指定する。
set-option -g status-left-length 20

# status-leftの見た目を変更
set-option -g status-left "#[bg=colour160]  #S  #[default]"

# status-rightの見た目を変更
set-option -g status-right "#[bg=colour214, fg=colour16] #H #[bg=colour72] %Y/%m/%d #[bg=colour32] %a #[bg=colour56, fg=colour255] %H:%M "

# window-status を中央揃えで配置する
set-option -g status-justify "centre"

# window-statusの見た目を変更
setw -g window-status-format '#[bg=colour166, fg=colour246] #I #W '

# prefixを押したときに、押されていることがわかるように
setw -g window-status-current-format '#[bg=colour208]#{?client_prefix,#[bg=colour214]#[fg=colour16],} #I #W '
```

# 参考になるURL
- [tmuxチートシート](https://qiita.com/nmrmsys/items/03f97f5eabec18a3a18b){:target="_blank"}
- [.tmux.confの設定](https://qiita.com/youichiro/items/dd54c38c2f3873348c78){:target="_blank"}
- [tmux の status line の設定方法](https://qiita.com/nojima/items/9bc576c922da3604a72b){:target="_blank"}