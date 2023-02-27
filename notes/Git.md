---
title: "Git 個人的メモ"
date: "2022-06-20 21:00:00"
update: "2023-02-27 20:30:00"
category: "Note"
hero: https://tech-diary.net/wp-content/uploads/2021/10/how-to-use-git-and-github.png
tags: ["Memo", "Git"]
layout: note
excerpt: Git操作で役に立ちそうな個人的メモです。
toc: true
---

# はじめに

Git操作で役に立ちそうな個人的メモです。

<!--more-->

# git pullを強制する

```console
git fetch origin main
git reset --hard origin/main
```

# pushしてしまったものを元に戻す

コミットのIDを取得する

```console
git reset --hard <コミットID>
git push -f origin main
```

# gitの一連の流れを自動化するbashファイル

以下のgit.shを.gitと同階層に置いた上で実行

<script src="https://gist.github.com/Absolute-Value/884943d8d32398582dd1476ab8221711.js"></script>

## 実行方法
コミットメッセージがUpdateで良い場合
```console
$ bash git.sh
```
コミットメッセージを指定する場合
```console
$ bash git.sh <commit message>
```

### bashの省略(Mac)
ファイルに実行権限を与える
```console
$ chmod +x git.sh
```

以後は以下のコメントのみで実行できる
```console
$ ./git.sh
```

コミットメッセージを指定する場合は
```console
$ ./git.sh <commit message>
```

# VSCode上でGitを実行
1. フォルダを保存したいディレクトリに移動  
2. Gitのリポジトリをクローン
```bash
git clone <GitリポジトリのURL>
```
3. ファイル->フォルダを開く で、クローンしたディレクトリを開く  

* 編集する
    * 変更点は緑色で表示され、変更したファイルは黄色で表示される

1. 変更のファイルの右にある+を押すことで、git addができる
    - 面倒ならば省略が可能
2. Ctrl+Shift+G を押してソースの管理を表示
3. メッセージにコミットメッセージを記入
4. コミットを押すことでコミットができる
    - コミット右のvから、コミットとともにプッシュもできる