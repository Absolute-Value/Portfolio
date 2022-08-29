---
title: "Git 個人的メモ"
date: "2022-06-20 12:00:00"
category: "Note"
hero: https://tech-diary.net/wp-content/uploads/2021/10/how-to-use-git-and-github.png
tags: ["Memo", "Git"]
layout: note
excerpt: Git操作で役に立ちそうな個人的メモです。
---

Git操作で役に立ちそうな個人的メモです。

<!--more-->

# gitの一連の流れを自動化するbashファイル

以下のgit.shを.gitと同階層に置いた上で実行

## git.sh
{% highlight shell linenos %}
#!/bin/sh

git add .
if [ $# -eq 0 ]; then
    git commit -m "Update"
else
    git commit -m "$1"
fi
git push
{% endhighlight %}

## 実行方法
コミットメッセージがUpdateで良い場合
```console
$ bash git.sh
```
コミットメッセージを指定する場合
```console
$ bash git.sh <commit message>
```

###  bashの省略(Mac)
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