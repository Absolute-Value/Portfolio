---
title: "Git 個人的メモ"
date: "2022-06-20 21:00:00"
update: "2023-03-27 00:30:00"
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

# Gitの一連の流れを自動化するbashファイル
<details open>
<summary>Gitの一連の流れを自動化するbashファイル</summary>

<p>以下のgit.shを.gitと同階層に置いた上で実行</p>
<script src="https://gist.github.com/Absolute-Value/884943d8d32398582dd1476ab8221711.js"></script>

<h2>実行方法</h2>
<p>コミットメッセージがUpdateで良い場合</p>
<div class="language-console highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="gp">$</span><span class="w"> </span>bash git.sh
</code></pre></div></div>

<p>コミットメッセージを指定する場合</p>
<div class="language-console highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="gp">$</span><span class="w"> </span>bash git.sh &lt;commit message&gt;
</code></pre></div></div>

<h3>bashの省略(Mac)</h3>
<p>ファイルに実行権限を与える</p>
<div class="language-console highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="gp">$</span><span class="w"> </span><span class="nb">chmod</span> +x git.sh
</code></pre></div></div>

<p>以後は以下のコメントのみで実行できる</p>
<div class="language-console highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="gp">$</span><span class="w"> </span>./git.sh
</code></pre></div></div>

<p>コミットメッセージを指定する場合は</p>
<div class="language-console highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="gp">$</span><span class="w"> </span>./git.sh &lt;commit message&gt;
</code></pre></div></div>
</details>

# VSCode上でGitを実行

## フォルダ・ファイルの準備
1. フォルダを保存したいディレクトリに移動  
2. Gitのリポジトリをクローン
```bash
git clone <GitリポジトリのURL>
```
3. ファイル->フォルダを開く で、クローンしたディレクトリを開く  

##  ファイルを編集する
変更点は緑色で表示され、変更したファイルは黄色で表示される

## Gitの実行
![](images/Git/vscode.png)
1. Ctrl+Shift+G を押してソースの管理を表示
2. 変更したファイルの右にある+を押すことで、git addができる
    - 省略も可能（すべてaddされる）
3. Messageにコミットメッセージを記入
4. Commitを押すことでコミットができる
    - コミット右のvからCommit & Pushを押すことで、コミットとともにプッシュもできる
5. Sync Changesを押すことで、pushができる